part of 'notes_bloc.dart';

@immutable
sealed class NotesEvent {}

final class FetchAllNote extends NotesEvent {}
