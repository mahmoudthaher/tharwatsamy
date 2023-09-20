import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'nots_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNote() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    List<NoteModel> notesAfterReverse = notesBox.values.toList();
    notes = notesAfterReverse.reversed.toList();
    emit(NotesSuccess());
  }
}
