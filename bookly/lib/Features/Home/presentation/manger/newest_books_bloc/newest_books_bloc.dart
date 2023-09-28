import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_event.dart';
part 'newest_books_state.dart';

class NewestBooksBloc extends Bloc<NewestBooksEvent, NewestBooksState> {
  NewestBooksBloc() : super(NewestBooksInitial()) {
    on<NewestBooksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
