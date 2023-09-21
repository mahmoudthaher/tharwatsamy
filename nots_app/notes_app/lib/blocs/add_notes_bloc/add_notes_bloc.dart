import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_notes_event.dart';
part 'add_notes_state.dart';

class AddNotesBloc extends Bloc<AddNotesEvent, AddNotesState> {
  Color color = Color.fromARGB(255, 38, 136, 210);
  AddNotesBloc() : super(AddNotesBlocInitial()) {
    on<AddNotesEvent>((event, emit) async {
      if (event is AddNote) {
        emit(AddNotesBlocLoading());
        event.note.color = color.value;
        emit(AddNotesBlocLoading());
        var notesBox = Hive.box<NoteModel>(kNotesBox);
        await notesBox.add(event.note);
        emit(AddNotesBlocSuccess());
      }
    });
  }
}
