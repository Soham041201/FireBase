import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_project/common/screens/wrapper.dart';
import 'package:dummy_project/user/models/userresult.dart';
import 'package:dummy_project/user/screens/addpatient.dart';

import 'package:flutter/material.dart';

class Searchpatienttoadd extends StatefulWidget {
  @override
  _SearchpatienttoaddState createState() => _SearchpatienttoaddState();
}

class _SearchpatienttoaddState extends State<Searchpatienttoadd> {
  TextEditingController searchtexteditingcontroller = TextEditingController();
  Future<QuerySnapshot> ?futuresearchresults;

  controlSearching(String str) {
    Future<QuerySnapshot> allusers = FirebaseFirestore.instance
        .collection('Registered Clinics')
        .doc(useridclinic.toString())
        .collection("All patient data")
        .where("First name", isGreaterThanOrEqualTo: str)
        .get();
    setState(() {
      futuresearchresults = allusers;
    });
  }

  AppBar searchPageHeader() {
    return AppBar(
      backgroundColor: (Colors.blue[900])!,
      title: TextFormField(
        style: TextStyle(fontSize: 18.0, color: Colors.black),
        controller: searchtexteditingcontroller,
        decoration: InputDecoration(
          hintText: "Search here...",
          hintStyle: TextStyle(color: Colors.black),
          filled: true,
          prefixIcon: Icon(
            Icons.person_pin,
            color: Colors.black,
            size: 30,
          ),
          suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onPressed: () {
                searchtexteditingcontroller.clear();
              }),
        ),
        onFieldSubmitted: controlSearching,
      ),
    );
  }

  nosearchresultsscreen() {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Icon(Icons.group, color: Colors.black, size: 200),
            Text(
              "Search Users",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  searchresultsscreen() {
    return FutureBuilder(
        future: futuresearchresults,
        builder: (context, AsyncSnapshot<QuerySnapshot> datasnapshot) {
          if (!datasnapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            List<UserResult> searchuserresult = [];
            datasnapshot.data!.docs.forEach((document) {
              Usersearchmodel usersearchmodel =
                  Usersearchmodel.fromDocument(document);
              UserResult userResult = UserResult(usersearchmodel);
              searchuserresult.add(userResult);
            });
            return ListView(
              children: searchuserresult,
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: searchPageHeader(),
      body: futuresearchresults == null
          ? nosearchresultsscreen()
          : searchresultsscreen(),
    );
  }
}

class UserResult extends StatelessWidget {
  final Usersearchmodel usersearchmodel;
  UserResult(this.usersearchmodel);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddPatient(usersearchmodel.name,
                            usersearchmodel.url, usersearchmodel.docid)));
              },
              child: ListTile(
                // leading: CircleAvatar(
                //   backgroundColor: Colors.white,
                //   backgroundImage:
                //       // CachedNetworkImageProvider(usersearchmodel.url),
                // ),
                title: Text(
                  usersearchmodel.name,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
