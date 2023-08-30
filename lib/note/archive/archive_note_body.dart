import 'package:flutter/material.dart';

import '../../resources/widget/custom_app_bar.dart';
import 'archive_note_list_view_itm.dart';


class ArchiveNoteViewBody extends StatelessWidget {
  const ArchiveNoteViewBody({
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
            title: 'Archive Note',
          ),
          Expanded(
            child: ArchiveNotsListView(),
          ),
        ],
      ),
    );
  }
}
