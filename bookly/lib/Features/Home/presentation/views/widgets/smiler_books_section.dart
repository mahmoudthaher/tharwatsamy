import 'package:bookly/Features/Home/presentation/views/widgets/similar_books_list_view_.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class SmilerBooksSection extends StatelessWidget {
  const SmilerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        const SimilarBooksListView(),
      ],
    );
  }
}
