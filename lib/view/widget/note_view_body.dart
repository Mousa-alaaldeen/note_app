import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_note_itm.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          CustomAppBar(),
          NoteItm(),
        ],
      ),
    );
  }
}
