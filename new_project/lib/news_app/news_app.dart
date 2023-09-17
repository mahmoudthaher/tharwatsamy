import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/news_app/block/news_bloc/news_bloc.dart';
import 'package:new_project/news_app/cubits/news_cubits.dart';
import 'package:new_project/news_app/views/home_page.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubits>(
          create: (context) => NewsCubits(),
        ),
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
      ],
      child: MaterialApp(
        home: HomePageNews(),
      ),
    );
  }
}
