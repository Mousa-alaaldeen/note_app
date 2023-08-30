// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:note/resources/bloc.dart';
import 'package:note/note/note_view.dart';

import 'resources/constents.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();

  await Hive.openBox(kNotesBox);

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: NoteView(),
    );
  }
}
