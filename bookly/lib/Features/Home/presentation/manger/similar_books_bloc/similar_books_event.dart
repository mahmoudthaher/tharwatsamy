part of 'similar_books_bloc.dart';

sealed class SimilarBooksEvent extends Equatable {
  const SimilarBooksEvent();

  @override
  List<Object> get props => [];
}

final class FetchSimilarBooks extends SimilarBooksEvent {
  final String category;

  const FetchSimilarBooks({required this.category});
}
