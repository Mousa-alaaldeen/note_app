// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'add_note_form.dart';

class AddNoteBottmSheet extends StatelessWidget {
  const AddNoteBottmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: AddNoteForm(),
      ),
    );
  }
}
