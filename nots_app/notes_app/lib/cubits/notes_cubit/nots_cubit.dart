import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'nots_state.dart';

class NotsCubit extends Cubit<NotsState> {
  NotsCubit() : super(NotsInitial());
}
