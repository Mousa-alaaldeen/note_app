import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'note_list_view_itm.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          CustomAppBar(
            icon: Icons.search,
            title: 'Note',
          ),
          Expanded(
            child: NotsListView(),
          ),
        ],
      ),
    );
  }
}
