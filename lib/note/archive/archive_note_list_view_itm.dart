import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/resources/cubit/note_cubit.dart';
import 'package:note/resources/cubit/note_state.dart';

import '../../resources/tasks_builder.dart';

class ArchiveNotsListView extends StatelessWidget {
  const ArchiveNotsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var tasks = AddNoteCubit.get(context).archiveTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
