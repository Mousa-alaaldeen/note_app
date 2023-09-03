// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/resources/constents.dart';
import 'package:note/resources/note_bottm_sheet.dart';

import '../resources/cubit/note_cubit.dart';
import '../resources/cubit/note_state.dart';

class NoteView extends StatelessWidget {
  var ScaffoldKey = GlobalKey<ScaffoldState>();

  NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit()..createDatabase(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) {
            AddNoteCubit cubit = AddNoteCubit.get(context);
            return Scaffold(
              key: ScaffoldKey,
              body: ConditionalBuilder(
                condition: state is! AddNoteGetDatabaseLodingState,
                builder: (context) => SafeArea(
                  child: cubit.bottomScreen[cubit.carrentIndex],
                ),
                fallback: (BuildContext context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (cubit.isBottomSheetShown) {
                    Navigator.pop(context);

                    cubit.changeBottomSheetState(
                        icon: Icons.edit, isShow: false);
                  } else {
                    ScaffoldKey.currentState!
                        .showBottomSheet((context) => const AddNoteBottmSheet())
                        .closed
                        .then((value) {
                      cubit.changeBottomSheetState(
                          icon: Icons.edit, isShow: false);
                    });

                    cubit.changeBottomSheetState(icon: Icons.add, isShow: true);
                  }
                  // showModalBottomSheet(
                  //     shape: BeveledRectangleBorder(
                  //       borderRadius: BorderRadius.circular(16),
                  //     ),
                  //     context: context,
                  //     builder: (context) {
                  //       return const AddNoteBottmSheet();
                  //     });
                  // insertDatabase();
                },
                child: Icon(cubit.fabIcon),
              ),
              bottomNavigationBar: NavigationBar(
                shadowColor: Colors.amber,
                surfaceTintColor: Colors.cyanAccent,
                elevation: 20,
                destinations:  isA? cubit.bottom : cubit.bottomEn,
                selectedIndex: cubit.carrentIndex,
                onDestinationSelected: (index) {
                  cubit.changeBottom(index);
                },
              ),
            );
          }),
    );
  }
}
