import 'package:bookly/Features/Home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/Home/presentation/manger/featured_books_bloc/featured_books_bloc.dart';
import 'package:bookly/Features/Home/presentation/manger/newest_books_bloc/newest_books_bloc.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:bookly/core/utils/service_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FeaturedBooksBloc(
              getIt.get<HomeRepoImpl>(),
            ),
          ),
          BlocProvider(
            create: (context) => NewestBooksBloc(
              getIt.get<HomeRepoImpl>(),
            ),
          ),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
