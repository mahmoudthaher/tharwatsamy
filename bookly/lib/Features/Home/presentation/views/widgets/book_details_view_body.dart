import 'package:bookly/Features/Home/presentation/views/widgets/custom_book_detail_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomBookDetailAppBar(),
          ],
        ),
      ),
    );
  }
}
