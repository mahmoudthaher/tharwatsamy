import 'package:bookly/Features/Search/data/repos/search_repo_impl.dart';
import 'package:bookly/Features/Search/presentation/view_models/search_bloc/search_book_bloc.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly/core/utils/service_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchBookBloc(getIt.get<SearchRepoImpl>()),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
