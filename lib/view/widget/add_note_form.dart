// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note/cubit/add_note_cubit/add_note_state.dart';

import '../../constents.dart';
import 'custom_buttom.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle, date, time;

  AddNoteForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (BuildContext context, state) {
        if (state is AddNoteInsertDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, Object? state) {
        AddNoteCubit cubit = AddNoteCubit.get(context);
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 34,
              ),
              CustomTextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                height: 'Title',
                onSaved: (value) {
                  title = value;
                },
                prefixIcon: const Icon(Icons.title),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: timeController,
                keyboardType: TextInputType.datetime,
                height: 'Time',
                onSaved: (value) {
                  time = value;
                },
                prefixIcon: const Icon(Icons.watch_later_outlined),
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          primaryColor:
                              kPrimaryColor, // Change this to the desired color
                          hintColor: kPrimaryColor,

                          buttonTheme: const ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  ).then((value) {
                    timeController.text = value!.format(context).toString();
                  });
                  print('Timing taped');
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                height: 'Date',
                onSaved: (value) {
                  date = value;
                },
                prefixIcon: const Icon(Icons.calendar_today),
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2070-05-03'))
                      .then((value) {
                    dateController.text = DateFormat.yMMMMd().format(value!);
                  });
                  print('date taped');
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: contentController,
                keyboardType: TextInputType.text,
                height: 'content',
                maxLines: 5,
                onSaved: (value) {
                  subtitle = value;
                },
              ),
              const SizedBox(
                height: 90,
              ),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    cubit.insertDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text,
                        subtitle: contentController.text);
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
