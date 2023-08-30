abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class ChangeBottomNavState extends AddNoteState {}

class AddNoteCreateDatabaseState extends AddNoteState {}

class AddNoteGetDatabaseState extends AddNoteState {}

class AddNoteUpdateDatabaseState extends AddNoteState {}
class AddNoteDeleteDatabaseState extends AddNoteState {}

class AddNoteUpdateDatabaseErrorState extends AddNoteState {}

class AddNoteGetDatabaseLodingState extends AddNoteState {}

class AddNoteInsertDatabaseState extends AddNoteState {}

class AddNoteChangeBottomSheetState extends AddNoteState {}
