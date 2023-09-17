import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/news_app/cubits/news_cubits.dart';
import 'package:new_project/news_app/models/category_model.dart';
import 'package:new_project/news_app/views/category_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({required this.categories, super.key});
  final CategoryModel categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NewsCubits>(context).cityName = categories.categoryName;
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CategoryViewFinal();
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          height: 85,
          width: 165,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(categories.image), fit: BoxFit.fill),
          ),
          child: Center(
              child: Text(
            categories.categoryName,
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
