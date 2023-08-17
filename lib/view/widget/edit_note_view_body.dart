import 'package:flutter/material.dart';
import 'package:note/view/widget/custom_app_bar.dart';

import 'custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                CustomAppBar(
                  icon: Icons.check,
                  title: 'Edit Note',
                ),
                SizedBox(
                  height: 50,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
