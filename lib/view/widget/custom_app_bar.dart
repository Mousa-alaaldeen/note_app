import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note/cubit/add_note_cubit/add_note_state.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 28),
              ),
              const Spacer(),
              CustomSearchIcon(
                icon: icon,
                onTap: onTap,
              ),
            ],
          );
        },
      ),
    );
  }
}
