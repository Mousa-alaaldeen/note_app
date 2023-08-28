import 'package:flutter/material.dart';

import 'edit_note_view_body.dart';

class EdetNoteView extends StatelessWidget {
  const EdetNoteView({
    super.key,
    required this.title,
    required this.status,
    required this.id,
  });
  final String title;
  final int id;
  final String status;
  @override
  Widget build(BuildContext context) {
    return EditNoteViewBody(
      title: title,
      status: status,
      id: id,
    );
  }
}
