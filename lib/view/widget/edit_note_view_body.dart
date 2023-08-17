import 'package:flutter/material.dart';
import 'package:note/view/widget/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CustomAppBar(
                icon: Icons.check,
                title: 'Edit Note',
              )
            ],
          ),
        ),
      ),
    );
  }
}
