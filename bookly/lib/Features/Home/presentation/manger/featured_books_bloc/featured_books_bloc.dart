import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_event.dart';
part 'featured_books_state.dart';

class FeaturedBooksBloc extends Bloc<FeaturedBooksEvent, FeaturedBooksState> {
  FeaturedBooksBloc() : super(FeaturedBooksInitial()) {
    on<FeaturedBooksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
