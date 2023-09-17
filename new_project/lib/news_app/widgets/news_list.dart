import 'package:flutter/material.dart';
import 'package:new_project/news_app/models/article_model.dart';
import 'package:new_project/news_app/widgets/news_view.dart';

class NewsList extends StatelessWidget {
  const NewsList({required this.articless, super.key});
  final List<Articless> articless;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articless.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: NewsViews(articless: articless[index]),
          );
        },
      ),
    );
  }
}
