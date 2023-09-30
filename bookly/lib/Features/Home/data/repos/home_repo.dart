import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeatheredBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks();

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
