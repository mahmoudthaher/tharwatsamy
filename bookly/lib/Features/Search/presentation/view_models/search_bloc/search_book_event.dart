part of 'search_book_bloc.dart';

sealed class SearchBookEvent extends Equatable {
  const SearchBookEvent();

  @override
  List<Object> get props => [];
}

final class SearchBook extends SearchBookEvent {
  final String? bookName;

  const SearchBook({this.bookName});
}
