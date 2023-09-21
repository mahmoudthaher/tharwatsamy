import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  List<NoteModel>? notes;

  NotesBloc() : super(NotesBlocInitial()) {
    on<NotesEvent>((event, emit) {
      if (event is FetchAllNote) {
        var notesBox = Hive.box<NoteModel>(kNotesBox);
        List<NoteModel> notesAfterReverse = notesBox.values.toList();
        notes = notesAfterReverse.reversed.toList();
        emit(NotesBlocSuccess());
      }
    });
  }
}
