

import 'package:flutter/cupertino.dart';

import 'custom_note_itm.dart';

class NotsListView extends StatelessWidget {
  const NotsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: NoteItm(),
      ),
    );
  }
}
