import 'package:bookly/Features/Search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: kPaddingHomeView,
      child: Column(
        children: [
          CustomSearchTextField(),
        ],
      ),
    );
  }
}
