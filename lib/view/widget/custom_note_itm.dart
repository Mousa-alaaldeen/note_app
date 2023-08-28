import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note/cubit/add_note_cubit/add_note_cubit.dart';

Widget buildNoteItm(BuildContext context, Map model, index) {
  return Dismissible(
    key: Key(model['id'].toString()),
    onDismissed: (direction) {
      AddNoteCubit.get(context).deleteData(id: model['id']);
    },
    child: Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
        color: const Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              '${model['title']}',
              style: const TextStyle(color: Colors.black, fontSize: 26),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '${model['subtitle']}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                AddNoteCubit.get(context).deleteData(id: model['id']);
              },
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              children: [
                Text(
                  '${model['time']}',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  AddNoteCubit.get(context)
                      .updateData(status: 'done', id: model['id']);
                },
                icon: const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  AddNoteCubit.get(context)
                      .updateData(status: 'archive', id: model['id']);
                },
                icon: const Icon(
                  Icons.archive,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
