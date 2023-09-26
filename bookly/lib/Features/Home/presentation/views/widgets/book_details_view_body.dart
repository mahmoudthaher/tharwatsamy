import 'package:bookly/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/books_action.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_book_detail_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/similar_books_list_view_.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomBookDetailAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 11.h, //horizontal: width * .17
              ),
              child: const CustomBookImage(),
            ),
            const SizedBox(height: 43),
            Text(
              'The Jungle Book',
              style: Styles.textStyle30.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Opacity(
              opacity: .7,
              child: Text(
                'Rudyard Kipling',
                style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 18),
            const BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 37),
            const BooksAction(),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also like',
                style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SimilarBooksListView(),
          ],
        ),
      ),
    );
  }
}
