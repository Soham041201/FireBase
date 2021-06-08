import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_project/admin/screens/homepageadmin.dart';
import 'package:dummy_project/common/models/user.dart';
import 'package:dummy_project/user/screens/homepageuser.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/signin.dart';

String? useridclinic;
    String? roles;
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      var user = Provider.of<User?>(context);
      var users = Provider.of<auth.User>(context);
      // ignore: unrelated_type_equality_checks
      if (user == null) {
        return Signin();
      } else if (users.email!.length > 0) {
        role();
        if (roles == "Clinic") {
          return HomePageAdmin();
        } else if (roles == "receptionist") {
          return HomePageUser();
        }
      } else {
        return Signin();
      }
      return Signin();
    }

  }
  role() async {
      auth.User? _auth = auth.FirebaseAuth.instance.currentUser;
      auth.User? user = auth.FirebaseAuth.instance.currentUser;
      FutureBuilder(
        future:
            FirebaseFirestore.instance.collection("Users").doc(user!.uid).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            roles = snapshot.data!['Role'].toString();
            String role = snapshot.data!['Role'].toString();
            if (role == "receptionist") {
              useridclinic = snapshot.data!['uid society'].toString();
            } else {
              useridclinic = snapshot.data!['Uid'].toString();
            }
          }
          return CircularProgressIndicator();
        },
      );
      return role;
    }

