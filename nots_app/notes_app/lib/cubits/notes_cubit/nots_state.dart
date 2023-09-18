part of 'nots_cubit.dart';

@immutable
sealed class NotsState {}

final class NotsInitial extends NotsState {}

final class NotesInitial extends NotsState {}

final class NotesLoading extends NotsState {}

final class NotesSuccess extends NotsState {
  final List<NoteModel> noteModel;

  NotesSuccess({required this.noteModel});
}

final class NotesFailure extends NotsState {
  final String errMessage;

  NotesFailure({required this.errMessage});
}
