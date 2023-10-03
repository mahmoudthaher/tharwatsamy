import 'package:bookly/Features/Search/data/repos/search_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String bookName}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=intitle:$bookName&filter=free-ebooks');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioExaction(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
