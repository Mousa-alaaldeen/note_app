// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/resources/cubit/note_state.dart';

import 'package:sqflite/sqflite.dart';

import '../../note/archive/archive_note_body.dart';
import '../../note/done/done_note_body.dart';
import '../../note/tasks/note_view_body.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  static AddNoteCubit get(context) => BlocProvider.of(context);
  List<Widget> bottom = [
    const NavigationDestination(
      icon: Icon(Icons.menu),
      label: 'Tasks',
    ),
    const NavigationDestination(
      icon: Icon(Icons.check_circle),
      label: 'Done',
    ),
    const NavigationDestination(
      icon: Icon(Icons.archive),
      label: 'Archive',
    ),
  ];
  List<Widget> bottomScreen = [
    const NoteViewBody(),
    const DoneNoteViewBody(),
    const ArchiveNoteViewBody(),
  ];

  int carrentIndex = 0;
  void changeBottom(index) {
    carrentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  late Database dataBase;

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 2,
      onCreate: (dataBase, version) {
        print('Data base create');
        dataBase
            .execute(
                'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT ,subtitle TEXT,status TEXT)')
            .then((value) {
          print('create table');
        }).catchError((error) {
          print('Error when Criating table${error.toString()}');
        });
      },
      onOpen: (dataBase) {
        getDataFromDatabase(dataBase);
        print('Data base open');
      },
    ).then((value) {
      dataBase = value;
      emit(AddNoteCreateDatabaseState());
    });
  }

  void insertDatabase({
    required String title,
    required String time,
    required String date,
    required String subtitle,
  }) async {
    await dataBase.transaction((txn) => txn
            .rawInsert(
                'INSERT INTO tasks(title,date,time,subtitle,status) VALUES("$title","$date","$time","$subtitle","new")')
            .then((value) {
          print('$value inserted successfuly');
          getDataFromDatabase(dataBase);
          emit(AddNoteInsertDatabaseState());
        }).catchError((error) {
          print('Error when Inserting New Record${error.toString()}');
        }));
  }

  void updateData({
    required String status,
    required int id,
  }) {
    dataBase.rawUpdate('UPDATE  tasks SET status = ?  WHERE id = ?',
        [status, id]).then((value) {
      getDataFromDatabase(dataBase);
      emit(AddNoteUpdateDatabaseState());
    }).catchError((error) {
      print('*****************error');
      print(error.toString());
      print(newTasks);
      emit(AddNoteUpdateDatabaseErrorState());
    });
  }

  void deleteData({
    required int id,
  }) {
    dataBase.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(dataBase);
      emit(AddNoteDeleteDatabaseState());
    }).catchError((error) {
      print('*****************error');
      print(error.toString());
      print(newTasks);
      emit(AddNoteUpdateDatabaseErrorState());
    });
  }

  void getDataFromDatabase(dataBase) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(AddNoteGetDatabaseLodingState());
    dataBase.rawQuery('SELECT * FROM  tasks').then((value) {
      value.forEach((element) {
        print(element['status']);
        if (element['status'] == 'done') {
          doneTasks.add(element);
          print('dddd');
          print(doneTasks);
        } else if (element['status'] == 'archive') {
          archiveTasks.add(element);
          print('aaaaaaaaaaaaaaa');
          print(archiveTasks);
        } else {
          newTasks.add(element);
        }
      });
      print(newTasks);
      emit(AddNoteGetDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AddNoteChangeBottomSheetState());
  }
}
