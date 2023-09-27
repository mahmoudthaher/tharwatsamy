import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: kPaddingHomeView,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
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
          SearchResultSearchView(),
        ],
      ),
    );
  }
}

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
