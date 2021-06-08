import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dummy_project/common/screens/wrapper.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat("dd-MM-yyyy");

// ignore: camel_case_types
class crudMethods {
  Future<void> addData(patientInfo, String name) async {
    FirebaseFirestore.instance
        .collection('Registered Clinics')
        .doc(useridclinic.toString())
        .collection("All patient data")
        .doc(name.toString())
        .set(patientInfo)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addpatient(patientInfo, String name) async {
    print(patientInfo);
    String date = dateFormat.format(DateTime.now());
    await FirebaseFirestore.instance
        .collection('Registered Clinics')
        .doc(useridclinic.toString())
        .collection("All patient data")
        .doc(name.toString())
        .set(patientInfo)
        .catchError((e) {
      print(e);
    });
    await FirebaseFirestore.instance
        .collection('Registered Clinics')
        .doc(useridclinic.toString())
        .collection("Daily Data")
        .doc(date.toString())
        .collection("OPD data")
        .doc(name.toString())
        .set(patientInfo)
        .catchError((e) {
      print(e);
    });
  }
}
