import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note/cubit/add_note_cubit/add_note_state.dart';

import '../tasks_builder.dart';

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
