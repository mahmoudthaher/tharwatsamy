import 'package:bookly/Features/Home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class SearchResultSearchView extends StatelessWidget {
  const SearchResultSearchView({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: books.length,
      (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(books: books[index]),
        );
      },
    ));
  }
}

  //   ListView.builder(
  //     physics: const BouncingScrollPhysics(),
  //     padding: EdgeInsets.zero,
  //     itemCount: 10,
  //     itemBuilder: (context, index) {
  //       return const Padding(
  //         padding: EdgeInsets.symmetric(vertical: 10),
  //         child: BookListViewItem(),
  //       );
  //     },
  //   );
  //   ;
  // }
