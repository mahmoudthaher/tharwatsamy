part of 'add_notes_bloc.dart';

@immutable
sealed class AddNotesEvent {}

final class AddNote extends AddNotesEvent {
  final NoteModel note;

  AddNote({required this.note});
}
