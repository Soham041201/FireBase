import 'package:flutter/material.dart';
import 'package:understanding_firebase/Screens/models/music.dart';

class MusicTile extends StatelessWidget {

  final Music music;
  MusicTile({required this.music});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top:4),
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: 
      ListTile(
        leading: Text(music.type),
        title: Text(music.age),
        subtitle: Text(music.name),
      ),
    ) );

  }
}