import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/models/book_model/book_model.dart';

part 'similar_books_event.dart';
part 'similar_books_state.dart';

class SimilarBooksBloc extends Bloc<SimilarBooksEvent, SimilarBooksState> {
  final HomeRepo homeRepo;
  SimilarBooksBloc(this.homeRepo) : super(SimilarBooksInitial()) {
    on<SimilarBooksEvent>((event, emit) async {
      if (event is FetchSimilarBooks) {
        emit(SimilarBooksLoading());
        var result = await homeRepo.fetchSimilarBooks(category: event.category);
        result.fold((failure) {
          emit(SimilarBooksFailure(failure.errMessage));
        }, (books) {
          emit(SimilarBooksSuccess(books: books));
        });
      }
    });
  }
}
