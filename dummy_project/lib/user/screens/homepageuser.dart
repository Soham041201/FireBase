import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_project/common/screens/wrapper.dart';
import 'package:dummy_project/user/screens/searchpatient.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:dummy_project/user/screens/form_user.dart';
import 'package:dummy_project/common/services/auth.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat("dd-MM-yyyy");
String date = dateFormat.format(DateTime.now());

class HomePageUser extends StatefulWidget {
  @override
  _HomePageUserState createState() => _HomePageUserState();
}

int ?selectedUser;

class Constants {
  static const String Signout = 'Sign Out';
  static const List<String> choices = <String>[Signout];
}

void choiceAction(String choice) {
  if (choice == Constants.Signout) {
    AuthService().signout();
  }
}

class _HomePageUserState extends State<HomePageUser> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: (Colors.blue[900])!,
            title: Text("Clinic User"),
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
            leading: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Searchpatienttoadd()));
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PatientFormUser()),
              );
            },
            backgroundColor: (Colors.blue[900])!,
            child: Icon(Icons.person_add),
          ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Registered Clinics')
                .doc(useridclinic.toString())
                .collection("Daily Data")
                .doc(date.toString())
                .collection("OPD data")
                .snapshots(),
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return Text('Loading Info...Please Wait');
              return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: InkWell(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              snapshot.data!.docs[index]['ImageUrl'],
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docs[index]['First name'],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: null,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
