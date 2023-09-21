part of 'notes_bloc_bloc.dart';

@immutable
sealed class NotesBlocEvent {}

final class FetchAllNote extends NotesBlocEvent {}
