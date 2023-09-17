import 'package:flutter/material.dart';
import 'package:new_project/news_app/widgets/category_list.dart';
import 'package:new_project/news_app/widgets/news_list_builder.dart';

class HomePageNews extends StatefulWidget {
  const HomePageNews({super.key});

  @override
  State<HomePageNews> createState() => _HomePageNewsState();
}

class _HomePageNewsState extends State<HomePageNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Cloud',
                style: TextStyle(color: Colors.orangeAccent),
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CategoryList()),
              SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              ListNewsBuilder()
            ],
          ),
        ));
  }
}
