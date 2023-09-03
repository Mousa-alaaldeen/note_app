import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../resources/widget/custom_app_bar.dart';
import 'done_note_list_View_itm.dart';

class DoneNoteViewBody extends StatelessWidget {
  const DoneNoteViewBody({
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
            icon: Icons.search,
            title: S.of(context).titletDone,
          ),
          const Expanded(
            child: DoneNotsListView(),
          ),
        ],
      ),
    );
  }
}
