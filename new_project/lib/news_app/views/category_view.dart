import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/news_app/cubits/news_cubits.dart';
import 'package:new_project/news_app/widgets/news_list_builder.dart';

class CategoryViewFinal extends StatelessWidget {
  const CategoryViewFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          BlocProvider.of<NewsCubits>(context).cityName,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: CustomScrollView(
            slivers: [
              ListNewsBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
