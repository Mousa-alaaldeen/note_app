// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:note/view/note_view.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: NoteView(),
    );
  }
}
