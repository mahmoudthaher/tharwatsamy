import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'nots_state.dart';

class NotsCubit extends Cubit<NotsState> {
  NotsCubit() : super(NotsInitial());
  List<NoteModel>? notes;
  fetchAllNote() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
  }
}
