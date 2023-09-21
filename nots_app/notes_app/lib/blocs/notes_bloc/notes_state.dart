part of 'notes_bloc.dart';

@immutable
sealed class NotesState {}

final class NotesBlocInitial extends NotesState {}

final class NotesBlocSuccess extends NotesState {}
