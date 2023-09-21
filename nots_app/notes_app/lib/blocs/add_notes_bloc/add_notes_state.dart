part of 'add_notes_bloc.dart';

@immutable
sealed class AddNotesState {}

final class AddNotesBlocInitial extends AddNotesState {}

final class AddNotesBlocLoading extends AddNotesState {}

final class AddNotesBlocSuccess extends AddNotesState {}
