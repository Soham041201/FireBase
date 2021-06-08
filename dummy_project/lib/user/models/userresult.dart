import 'package:cloud_firestore/cloud_firestore.dart';

class Usersearchmodel {
  String name;
  String docid;
  String url;

  Usersearchmodel({required this.name, required this.url,required this.docid});

  factory Usersearchmodel.fromDocument(DocumentSnapshot snapshot) {
    return Usersearchmodel(
        name: snapshot['First name'] + " " + snapshot['Last name'],
        url: snapshot['ImageUrl'],
        docid: snapshot.id.toString(),
        );
  }
}
