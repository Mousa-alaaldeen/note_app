// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/resources/cubit/note_cubit.dart';
import 'package:note/resources/cubit/note_state.dart';

import '../../resources/tasks_builder.dart';

class DoneNotsListView extends StatelessWidget {
  const DoneNotsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var tasks = AddNoteCubit.get(context).doneTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
