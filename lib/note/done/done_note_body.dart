import 'package:flutter/material.dart';

import '../../resources/widget/custom_app_bar.dart';
import 'done_note_list_View_itm.dart';

class DoneNoteViewBody extends StatelessWidget {
  const DoneNoteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          CustomAppBar(
            icon: Icons.search,
            title: 'Done Note',
          ),
          Expanded(
            child: DoneNotsListView(),
          ),
        ],
      ),
    );
  }
}
