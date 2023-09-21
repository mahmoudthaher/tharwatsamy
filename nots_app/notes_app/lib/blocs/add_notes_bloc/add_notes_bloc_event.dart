part of 'add_notes_bloc_bloc.dart';

@immutable
sealed class AddNotesBlocEvent {}

final class AddNote extends AddNotesBlocEvent {
  final NoteModel note;

  AddNote({required this.note});
}
