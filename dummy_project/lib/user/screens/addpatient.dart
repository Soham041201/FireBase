import 'package:dummy_project/common/services/crud.dart';
import 'package:dummy_project/user/screens/homepageuser.dart';
import 'package:dummy_project/user/screens/searchpatient.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

crudMethods curdobj = crudMethods();
final timeFormat = DateFormat("h:mm a");
final dateFormat = DateFormat("dd-MM-yyyy");
String date = dateFormat.format(DateTime.now());

class AddPatient extends StatefulWidget {
  final String name;
  final String url;
  final String id;
  AddPatient(this.name, this.url, this.id);
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  String weight = "";
  String symptoms = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Searchpatienttoadd(),
                ),
              );
            },
          ),
          title: Text('Add Patient'),
          backgroundColor: (Colors.blue[900])!,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment(0.0, 0.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 96,
                        backgroundImage: NetworkImage(widget.url),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Name:   ',
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          color: Colors.green!.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        widget.name,
                        textScaleFactor: 1.5,
                      ),
                      Text('  '),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Weight'),
                  keyboardType: TextInputType.number,
                  // ignore: missing_return
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your weight';
                    }
                  },
                  onSaved: (String ?newValue) {
                    weight = newValue!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Current Symptoms'),
                  // ignore: missing_return
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Current Symptoms.';
                    }
                  },
                  onSaved: (String ?newValue) {
                    symptoms = newValue!;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                      color: Colors.blue,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          curdobj.addpatient({
                            "url": widget.url,
                            "Full Name": widget.name,
                            "weight": weight,
                            "Symptoms": symptoms,
                            "Status": 0,
                            "id": widget.id,
                            "time":
                                timeFormat.format(DateTime.now()).toString(),
                            "Date": dateFormat.format(DateTime.now()).toString()
                          }, widget.id).whenComplete(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageUser()));
                          });
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
