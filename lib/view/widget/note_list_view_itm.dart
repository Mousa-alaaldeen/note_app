import 'package:flutter/cupertino.dart';

import 'custom_note_itm.dart';

class NotsListView extends StatelessWidget {
  const NotsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: NoteItm(),
        ),
      ),
    );
  }
}
