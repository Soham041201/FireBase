import 'package:flutter/material.dart';
  InputDecoration formDesign(String text) {
    return InputDecoration(
                hintText: text,
                fillColor: Colors.blue[200],
                filled: true,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blue.shade200,width: 2.0)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.purple,width: 2.0)),

              );
  }
 