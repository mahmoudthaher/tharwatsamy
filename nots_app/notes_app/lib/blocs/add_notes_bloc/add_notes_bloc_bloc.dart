import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_notes_bloc_event.dart';
part 'add_notes_bloc_state.dart';

class AddNotesBlocBloc extends Bloc<AddNotesBlocEvent, AddNotesBlocState> {
  Color color = Color.fromARGB(255, 38, 136, 210);
  AddNotesBlocBloc() : super(AddNotesBlocInitial()) {
    on<AddNotesBlocEvent>((event, emit) async {
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
