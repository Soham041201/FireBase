import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dummy_project/common/screens/wrapper.dart';
import 'package:dummy_project/user/screens/form_user.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class Data extends StatefulWidget {
  String docid;
  Data(this.docid);
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: SafeArea(
        child: Builder(
          builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text("DigiClinic"),
                backgroundColor: (Colors.blue[900])!,
              ),
              body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Registered Clinics')
                    .doc(useridclinic.toString())
                    .collection("All patient data")
                    .doc(widget.docid.toString())
                    .snapshots(),
                builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot) {
                  print(widget.docid);
                  if (!snapshot.hasData)
                    return Text('Loading Info...Please Wait');
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //Photo avatar//////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                30.0, 60.0, 30.0, 30.0),
                            child: Container(
                              //alignment: Alignment(0.0, 0.0),
                              child: CircleAvatar(
                                radius: 100,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 96,
                                  backgroundImage: NetworkImage(
                                    snapshot.data!['ImageUrl'],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //First Name , Last Name//////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Name:   ',
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: (Colors.blue[900])!.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  snapshot.data!['First name'],
                                  textScaleFactor: 1.5,
                                ),
                                Text('  '),
                                Text(
                                  snapshot.data!['Last name'],
                                  textScaleFactor: 1.5,
                                ),
                              ],
                            ),
                          ),
                          //Phone Number//////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Phone Number:   ',
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: (Colors.blue[900])!.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  snapshot.data!['Phone Number'].toString(),
                                  textScaleFactor: 1.5,
                                ),
                              ],
                            ),
                          ),
                          //Address//////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Address:   ',
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: (Colors.blue[900])!.withOpacity(0.8),
                                  ),
                                ),
                                Expanded(
                                  child: Text(snapshot.data!['Address'],
                                      textScaleFactor: 1.5),
                                ),
                              ],
                            ),
                          ),
                          //Age//////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Age:   ',
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: (Colors.blue[900])!.withOpacity(0.8),
                                  ),
                                ),
                                Text(snapshot.data!['Age'].toString(),
                                    textScaleFactor: 1.5),
                              ],
                            ),
                          ),
                          //Blood Group//////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Blood Group:   ',
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: (Colors.blue[900])!.withOpacity(0.8),
                                  ),
                                ),
                                Text(snapshot.data!['Blood Group'].toString(),
                                    textScaleFactor: 1.5),
                              ],
                            ),
                          ),
                          //Medical History//////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Medical History:   ',
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: (Colors.blue[900])!.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                    snapshot.data!['Medical History'].toString(),
                                    textScaleFactor: 1.5),
                              ],
                            ),
                          ),
                          //Current Symptoms//////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Current Symptoms:   ',
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: (Colors.blue[900])!.withOpacity(0.8),
                                  ),
                                ),
                                Expanded(
                                  child: Text(snapshot.data!['Current Symptoms'],
                                      textScaleFactor: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: null,
                child: Icon(Icons.delete),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              )),
        ),
      ),
    );
  }
}

Future deletePatient() async {
  Reference storageReference =
      await FirebaseStorage.instance.refFromURL(imurl);
  await storageReference.delete();
  await FirebaseFirestore.instance
      .collection('Registered Clinics')
      .doc(useridclinic.toString())
      .delete();
}
