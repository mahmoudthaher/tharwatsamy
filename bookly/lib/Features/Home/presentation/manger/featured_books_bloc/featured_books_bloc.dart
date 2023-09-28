import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_event.dart';
part 'featured_books_state.dart';

class FeaturedBooksBloc extends Bloc<FeaturedBooksEvent, FeaturedBooksState> {
  final HomeRepo homeRepo;
  FeaturedBooksBloc(this.homeRepo) : super(FeaturedBooksInitial()) {
    on<FeaturedBooksEvent>((event, emit) async {
      if (event is FetchFeatureBooks) {
        emit(FeaturedBooksLoading());
        var result = await homeRepo.fetchFeatheredBooks();
        result.fold((failure) {
          emit(FeaturedBooksFailure(failure.errMessage));
        }, (books) {
          emit(FeaturedBooksSuccess(books: books));
        });
      }
    });
  }
}
