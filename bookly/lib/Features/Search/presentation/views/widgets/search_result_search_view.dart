import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultSearchView extends StatelessWidget {
  const SearchResultSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: 10,
      (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
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
