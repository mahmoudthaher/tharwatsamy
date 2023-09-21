part of 'add_notes_bloc_bloc.dart';

@immutable
sealed class AddNotesBlocState {}

final class AddNotesBlocInitial extends AddNotesBlocState {}

final class AddNotesBlocLoading extends AddNotesBlocState {}

final class AddNotesBlocSuccess extends AddNotesBlocState {}
