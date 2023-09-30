import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo.dart';

part 'newest_books_event.dart';
part 'newest_books_state.dart';

class NewestBooksBloc extends Bloc<NewestBooksEvent, NewestBooksState> {
  final HomeRepo homeRepo;
  NewestBooksBloc(this.homeRepo) : super(NewestBooksInitial()) {
    on<NewestBooksEvent>((event, emit) async {
      if (event is FetchNewest) {
        emit(NewestBooksLoading());
        var result = await homeRepo.fetchNewsBooks();
        result.fold((failure) {
          emit(NewestBooksFailure(failure.errMessage));
        }, (books) {
          emit(NewestBooksSuccess(books: books));
        });
      }
    });
  }
}
