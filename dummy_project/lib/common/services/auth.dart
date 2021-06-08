import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

//Creating a stream of signedin users
Stream<User?>? get user {
  return _auth.authStateChanges();
} 

  // Sign in anonymously

  Future<String> getCurrentUID() async {
    return (_auth.currentUser)!.uid;
  }

//Sign in with email and pass
  Future signinwithemailandpass(String email, String pass) async {
    try {
      auth.UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      auth.User user = result.user!;
      String userid = result.user.toString();
      if (user.uid.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and pass as a user
  Future<bool?> registerwithemailandpassuser(
      String email, String pass, String name, String society) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      auth.User user = result.user!;
      auth.User? users = await _auth.currentUser;
      String useridclinic = '';
      await FirebaseFirestore.instance
          .collection("Users")
          .where("Name", isEqualTo: society)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          useridclinic = element.id.toString();
        });
      });
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid.toString())
          .set({
        "Name": name,
        "Clinic": society,
        "Uid peorsnal": user.uid.toString(),
        "uid society": useridclinic.toString(),
        "Role": "receptionist"
      });
      try {
        await user.sendEmailVerification();
        return true;
      } catch (e) {
        print(e);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

//register with email and pass for society
  Future<bool?> registerwithemailandpass(String email, String pass, String name,
      String address, String flats) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      auth.User? user = result.user;
      auth.User? users = await _auth.currentUser;
      await FirebaseFirestore.instance
          .collection("Registered Clinics")
          .doc(users!.uid.toString())
          .set({
        "Name": name,
        "Address": address,
        "No of doctors": flats,
        "Uid": user!.uid.toString()
      });
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid.toString())
          .set({
        "Name": name,
        "Address": address,
        "No of doctors": flats,
        "Uid": user.uid.toString(),
        "Role": "Clinic"
      });
      try {
        await user.sendEmailVerification();
        return true;
      } catch (e) {
        print(e);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  //Signout
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
