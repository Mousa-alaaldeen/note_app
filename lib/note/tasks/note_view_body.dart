import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../resources/cubit/note_cubit.dart';
import '../../resources/widget/custom_app_bar.dart';
import 'note_list_view_itm.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          CustomAppBar(
            icon: Icons.language_sharp,
            onTap: () {
              AddNoteCubit.get(context).appChangeMode();
            },
            title: S.of(context).titletTasks,
          ),
          const Expanded(
            child: NotsListView(),
          ),
        ],
      ),
    );
  }
}
