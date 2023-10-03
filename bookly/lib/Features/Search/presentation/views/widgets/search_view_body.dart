import 'package:bookly/Features/Search/presentation/view_models/search_bloc/search_book_bloc.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/search_result_search_view.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBookBloc>(context).add(const SearchBook());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingHomeView,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CustomSearchTextField(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Search Result',
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          BlocBuilder<SearchBookBloc, SearchBookState>(
            builder: (context, state) {
              if (state is SearchBookSuccess) {
                return SearchResultSearchView(
                  books: state.bookModel,
                );
              } else if (state is SearchBookFailure) {
                return SliverToBoxAdapter(
                  child: CustomErrorWidget(errMessage: state.errMessage),
                );
              }
              return const SliverToBoxAdapter(
                child: CustomLoadingIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
