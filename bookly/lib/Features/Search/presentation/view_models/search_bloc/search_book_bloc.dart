import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Search/data/repos/search_repo.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'search_book_event.dart';
part 'search_book_state.dart';

class SearchBookBloc extends Bloc<SearchBookEvent, SearchBookState> {
  final SearchRepo searchRepo;

  SearchBookBloc(this.searchRepo) : super(SearchBookInitial()) {
    on<SearchBookEvent>((event, emit) async {
      if (event is SearchBook) {
        emit(SearchBookLoading());
        var result =
            await searchRepo.searchBooks(bookName: event.bookName ?? '');
        result.fold((failure) {
          emit(SearchBookFailure(errMessage: failure.errMessage));
        }, (books) {
          emit(SearchBookSuccess(bookModel: books));
        });
      }
    });
  }
}
