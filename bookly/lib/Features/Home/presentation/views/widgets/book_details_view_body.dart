import 'package:bookly/Features/Home/presentation/views/widgets/custom_book_detail_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomBookDetailAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
              ),
              child: const FeaturedListViewItem(),
            )
          ],
        ),
      ),
    );
  }
}
