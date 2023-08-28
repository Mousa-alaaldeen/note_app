import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'note_list_view_itm.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({
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
            title: 'Note Tasks',
          ),
          Expanded(
            child: NotsListView(),
          ),
        ],
      ),
    );
  }
}
