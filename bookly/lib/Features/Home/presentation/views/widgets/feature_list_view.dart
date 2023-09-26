import 'package:bookly/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class FeatureBooks extends StatelessWidget {
  const FeatureBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 8),
            child: CustomBookImage(),
          );
        },
      ),
    );
  }
}
