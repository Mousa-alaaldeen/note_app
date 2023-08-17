import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddNoteBottmSheet extends StatelessWidget {
  const AddNoteBottmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 34,
          ),
          CustomTextField(
            height: 'Title',
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            height: 'context',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
