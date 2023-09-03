import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../resources/widget/custom_app_bar.dart';
import 'archive_note_list_view_itm.dart';

class ArchiveNoteViewBody extends StatelessWidget {
  const ArchiveNoteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          CustomAppBar(
            icon: Icons.search,
            title: S.of(context).titletArchive,
          ),
          const Expanded(
            child: ArchiveNotsListView(),
          ),
        ],
      ),
    );
  }
}
