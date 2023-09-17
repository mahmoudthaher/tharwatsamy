import 'package:flutter/material.dart';
import 'package:new_project/news_app/models/category_model.dart';
import 'package:new_project/news_app/widgets/category_view.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
      image: 'assets/images/news/business.avif',
      categoryName: 'Business',
    ),
    CategoryModel(
      image: 'assets/images/news/entertaiment.avif',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      image: 'assets/images/news/health.avif',
      categoryName: 'Health',
    ),
    CategoryModel(
      image: 'assets/images/news/science.avif',
      categoryName: 'Science',
    ),
    CategoryModel(
      image: 'assets/images/news/technology.jpeg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      image: 'assets/images/news/sports.avif',
      categoryName: 'Sports',
    ),
    CategoryModel(
      image: 'assets/images/news/general.avif',
      categoryName: 'General',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          CategoryModel categoty = categories[index];
          return CategoryView(
            categories: categoty,
          );
        },
      ),
    );
  }
}
