// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/models/note_model.dart';
import 'package:note/view/note_view.dart';

import 'constents.dart';
import 'core/util/function/bloc_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();

  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
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
