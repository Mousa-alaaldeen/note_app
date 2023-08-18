abstract class AddNoteState{}
class AddNoteInitial extends AddNoteState{}
class AddNoteLoding extends AddNoteState{}
class AddNoteSuccses extends AddNoteState{}
class AddNoteError extends AddNoteState{
  final String errMessage ;

  AddNoteError(this.errMessage);
}