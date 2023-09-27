import 'package:bookly/Features/Home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_book_detail_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/smiler_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CustomBookDetailAppBar(),
                  BookDetailsSection(),
                  Expanded(child: SizedBox(height: 50)),
                  SizedBox(height: 40),
                  SmilerBooksSection(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
