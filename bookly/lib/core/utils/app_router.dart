import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/Home/presentation/manger/similar_books_bloc/similar_books_bloc.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Home/presentation/views/home_view.dart';
import 'package:bookly/Features/Search/presentation/views/search_view.dart';
import 'package:bookly/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly/core/utils/service_location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksBloc(getIt.get<HomeRepoImpl>()),
          child: BooksDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
