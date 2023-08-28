// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note/cubit/add_note_cubit/add_note_state.dart';
import 'package:note/view/widget/custom_app_bar.dart';

import 'custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  EditNoteViewBody(
      {super.key, required this.title, required this.status, required this.id});
  final String title;
  final String status;
  final int id;

  var titleController = TextEditingController();
  var contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AddNoteCubit.get(context);
          titleController.text = title;
          contentController.text = status;
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      CustomAppBar(
                        onTap: () {
                          cubit.updateData(status: 'popo', id: id);
                        },
                        icon: Icons.check,
                        title: 'Edit Note',
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextField(
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        height: 'Title',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        controller: contentController,
                        keyboardType: TextInputType.text,
                        height: 'content',
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
