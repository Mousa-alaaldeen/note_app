import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/resources/cubit/note_cubit.dart';
import 'package:note/resources/cubit/note_state.dart';
import 'package:note/resources/tasks_builder.dart';

class NotsListView extends StatelessWidget {
  const NotsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var tasks = AddNoteCubit.get(context).newTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
