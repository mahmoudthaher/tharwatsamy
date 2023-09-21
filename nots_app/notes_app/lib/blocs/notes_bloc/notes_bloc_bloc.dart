import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_bloc_event.dart';
part 'notes_bloc_state.dart';

class NotesBlocBloc extends Bloc<NotesBlocEvent, NotesBlocState> {
  List<NoteModel>? notes;

  NotesBlocBloc() : super(NotesBlocInitial()) {
    on<NotesBlocEvent>((event, emit) {
      if (event is FetchAllNote) {
        var notesBox = Hive.box<NoteModel>(kNotesBox);
        List<NoteModel> notesAfterReverse = notesBox.values.toList();
        notes = notesAfterReverse.reversed.toList();
        emit(NotesBlocSuccess());
      }
    });
  }
}
