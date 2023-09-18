part of 'nots_cubit.dart';

@immutable
sealed class NotsState {}

final class NotsInitial extends NotsState {}

final class AddNotesInitial extends NotsState {}

final class AddNotesLoading extends NotsState {}

final class AddNotesSuccess extends NotsState {
  final List<NoteModel> noteModel;

  AddNotesSuccess({required this.noteModel});
}

final class AddNotesFailure extends NotsState {
  final String errMessage;

  AddNotesFailure({required this.errMessage});
}
