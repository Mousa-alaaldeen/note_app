// ignore_for_file: camel_case_types

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'custom_note_itm.dart';

class tasksBuilder extends StatelessWidget {
  const tasksBuilder({
    super.key,
    required this.tasks,
  });

  final List<Map> tasks;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: tasks.isNotEmpty,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: buildNoteItm(context, tasks[index], index),
              ),
            ),
          );
        },
        fallback: (context) => const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  size: 100,
                  color: Colors.grey,
                ),
                Text(
                  'No Tasks Yet , Please Add Some Tasks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ],
            ));
  }
}
