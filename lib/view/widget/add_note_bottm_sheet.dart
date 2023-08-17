// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottmSheet extends StatelessWidget {
  const AddNoteBottmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 700,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 34,
              ),
              CustomTextField(
                height: 'Title',
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                height: 'content',
                maxLines: 5,
              ),
              SizedBox(
                height: 90,
              ),
              CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}
