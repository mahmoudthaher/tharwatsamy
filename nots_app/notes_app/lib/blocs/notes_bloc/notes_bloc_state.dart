part of 'notes_bloc_bloc.dart';

@immutable
sealed class NotesBlocState {}

final class NotesBlocInitial extends NotesBlocState {}

final class NotesBlocSuccess extends NotesBlocState {}
