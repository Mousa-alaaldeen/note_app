import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note/constents.dart';
import 'package:note/cubit/add_note_cubit/add_note_state.dart';
import 'package:note/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoding());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNoteSuccses());
      await noteBox.add(note);
    } on Exception catch (e) {
      emit(AddNoteError(e.toString()));
    }
  }
}
