import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:dummy_project/user/screens/homepageuser.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:dummy_project/common/services/crud.dart';
import 'package:flutter/widgets.dart';

class PatientFormUser extends StatefulWidget {
  @override
  _PatientFormUserState createState() => _PatientFormUserState();
}

File ?sampleImage;
String imurl='';

class _PatientFormUserState extends State<PatientFormUser> {
  final _formKey = GlobalKey<FormState>();
  final _user=null;

  crudMethods crudObj = new crudMethods();

  /// Select an image via gallery or camera
  // ignore: unused_element

  int ?selectedRadioTile;
  int ?selectedRadio;

  Future getImage() async {
    // ignore: deprecated_member_use
    var tempImage = await ImagePicker.platform.pickImage(
        source: ImageSource.camera, imageQuality: 85);

    setState(() {
      sampleImage = tempImage as File?;
    });
  }

  //String dropdownValue = 'A+ve';

  Future uploadFile() async {
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(basename(sampleImage!.path));
    Task task = firebaseStorageRef.putFile(sampleImage!);
    // fileUploadDialogue(context);
    print('File Uploaded');
    imurl = (await firebaseStorageRef.getDownloadURL()).toString();

    setState(() {
      _user.imageURL = imurl;
    });

    print(_user.imageURL);
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageUser(),
                  ),
                );
              },
            ),
            title: Text('Create Patient'),
            backgroundColor: (Colors.blue[900])!,
          ),
          body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
              builder: (context) => Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'First name'),
                        // ignore: missing_return
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                        },
                        onSaved: (val) => setState(() => _user.firstName = val!),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Last name'),
                        // ignore: missing_return
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name.';
                          }
                        },
                        onSaved: (val) => setState(() => _user.lastName = val!),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                        child: Text('Gender'),
                      ),
                      RadioListTile(
                        value: 'Male',
                        groupValue: _user.gender,
                        title: Text("Male"),
                        onChanged: (val) => setState(() => _user.gender = val as String),
                        activeColor: (Colors.blue[900])!,
                      ),
                      RadioListTile(
                        value: 'Female',
                        groupValue: _user.gender,
                        title: Text("Female"),
                        onChanged: (val) => setState(() => _user.gender = val as String),
                        activeColor: (Colors.blue[900])!,
                      ),
                      RadioListTile(
                        value: 'Other',
                        groupValue: _user.gender,
                        title: Text("Other"),
                        onChanged: (val) => setState(() => _user.gender = val as String),
                        activeColor: (Colors.blue[900])!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Age'),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ],
                        keyboardType: TextInputType.number,
                        // ignore: missing_return
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Age.';
                          }
                        },
                        onSaved: (val) => setState(() => _user.age = val!),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Phone Number'),
                        keyboardType: TextInputType.number,
                        // ignore: missing_return
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Phone Number.';
                          }
                        },
                        onSaved: (val) =>
                            setState(() => _user.phoneNumber = val!),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Address'),
                        // ignore: missing_return
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Address.';
                          }
                        },
                        onSaved: (val) => setState(() => _user.address = val!),
                      ),
                      // Container(
                      //   padding: EdgeInsets.all(16),
                      //   child: DropDownFormField(
                      //     titleText: 'Blood Group',
                      //     hintText: 'Please choose one',
                      //     value: _user.dropdownValue,
                      //     onChanged: (value) {
                      //       setState(
                      //         () {
                      //           _user.dropdownValue = val!ue;
                      //         },
                      //       );
                      //     },
                      //     dataSource: [
                      //       {
                      //         "display": "A+ve",
                      //         "value": "A+ve",
                      //       },
                      //       {
                      //         "display": "A-ve",
                      //         "value": "A-ve",
                      //       },
                      //       {
                      //         "display": "B+ve",
                      //         "value": "B+ve",
                      //       },
                      //       {
                      //         "display": "B-ve",
                      //         "value": "B-ve",
                      //       },
                      //       {
                      //         "display": "AB+ve",
                      //         "value": "AB+ve",
                      //       },
                      //       {
                      //         "display": "AB-ve",
                      //         "value": "AB-ve",
                      //       },
                      //       {
                      //         "display": "O+ve",
                      //         "value": "O+ve",
                      //       },
                      //       {
                      //         "display": "O-ve",
                      //         "value": "O-ve",
                      //       },
                      //       {
                      //         "display": "Don't know",
                      //         "value": "Don't know",
                      //       },
                      //     ],
                      //     textField: 'display',
                      //     valueField: 'value',
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'Please enter your last name.';
                      //       }
                      //     },
                      //   ),
                      // ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Current Symptoms'),
                        // ignore: missing_return
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Current Symptoms.';
                          }
                        },
                        onSaved: (val) =>
                            setState(() => _user.currentSymptoms = val!),
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Past History(if any)'),
                        onSaved: (val) =>
                            setState(() => _user.medHistory = val!),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: RaisedButton(
                          color: (Colors.blue[900])!,
                          textColor: Colors.white,
                          onPressed: () async {
                            uploadFile();
                            Scaffold.of(context).showSnackBar(
                              new SnackBar(
                                content: Text('Uploading Image'),
                                duration: Duration(seconds: 12),
                              ),
                            );
                            await uploadFile();
                            Scaffold.of(context).showSnackBar(
                              new SnackBar(
                                content: Text('Image Uploaded'),
                                duration: Duration(seconds: 12),
                              ),
                            );
                            setState(() => _user.imageURL = imurl);
                            final form = _formKey.currentState;
                            if (form!.validate()) {
                              form.save();

                              _showDialog(context);

                              Map<String, dynamic> patientInfo = {
                                'First name': _user.firstName,
                                'Last name': _user.lastName,
                                'Age': _user.age,
                                'Phone Number': _user.phoneNumber,
                                'Address': _user.address,
                                'Current Symptoms': _user.currentSymptoms,
                                'Medical History': _user.medHistory,
                                'Blood Group': _user.dropdownValue,
                                'Gender': _user.gender,
                                'ImageUrl': _user.imageURL,
                                'searchKey': _user.firstName
                                    .substring(0, 1)
                                    .toUpperCase(),
                                'Addition date':
                                    DateTime.now().toIso8601String()
                              };
                              crudObj
                                  .addpatient(
                                      patientInfo,
                                      _user.firstName +
                                          _user.lastName +
                                          _user.phoneNumber)
                                  .then(
                                (result) {
                                  _showDialog(context);
                                },
                              ).catchError(
                                (e) {
                                  print(e);
                                },
                              );
                              await new Future.delayed(
                                const Duration(seconds: 2),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePageUser(),
                                ),
                              );
                            }
                          },
                          child: Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FloatingActionButton(
              backgroundColor: (Colors.blue[900])!,
              child: Icon(Icons.add_a_photo),
              onPressed: getImage,
            ),
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Saving data'),
      ),
    );
  }
}
