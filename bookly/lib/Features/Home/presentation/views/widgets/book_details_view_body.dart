import 'package:bookly/Features/Home/presentation/views/widgets/custom_book_detail_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomBookDetailAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.h, //horizontal: width * .17
              ),
              child: const CustomBookImage(),
            )
          ],
        ),
      ),
    );
  }
}
