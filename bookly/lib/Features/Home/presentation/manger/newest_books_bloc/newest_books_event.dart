part of 'newest_books_bloc.dart';

sealed class NewestBooksEvent extends Equatable {
  const NewestBooksEvent();

  @override
  List<Object> get props => [];
}

final class FetchNewest extends NewestBooksEvent {}
