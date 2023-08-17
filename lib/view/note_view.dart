import 'package:flutter/material.dart';
import 'package:note/view/widget/add_note_bottm_sheet.dart';
import 'package:note/view/widget/note_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: NoteViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddNoteBottmSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
