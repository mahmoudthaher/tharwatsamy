import 'dart:developer';

import 'package:bookly/Features/Home/presentation/manger/newest_books_bloc/newest_books_bloc.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksBloc, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (context, index) {
                log(state.books.length.toString());
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(books: state.books[index]),
                );
              },
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(errMessage: state.errMessage));
        }
        return const SliverToBoxAdapter(child: CustomLoadingIndicator());
      },
    );
  }
}
