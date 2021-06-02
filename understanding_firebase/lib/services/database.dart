import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:understanding_firebase/Screens/models/music.dart';

class DataBase {
  final String uid;
  DataBase({required this.uid});

  // Create a CollectionReference called users that references the firestore collection
  final CollectionReference musicData =
      FirebaseFirestore.instance.collection('musicData');

  Future updateUserData(String name, String age, String type) async {
    return await musicData
        .doc(uid)
        .set({'name': name, 'age': age, 'type': type});
  }

//list form snapshot

  List<Music> _musicListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Music(
          age: snapshot.docs[0]['age'],
          name: snapshot.docs[1]['name'],
          type: snapshot.docs[2]['type']);
    }).toList();
  }

  Stream<List<Music>> get music {
    return musicData.snapshots().map(_musicListfromSnapshot);
  }
}
