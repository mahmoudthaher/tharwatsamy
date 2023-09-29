import 'package:bookly/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 5),
            child: CustomBookImage(
                imageUrl:
                    'https://images.pexels.com/photos/18122232/pexels-photo-18122232/free-photo-of-deckchairs-at-beach-along-sea.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          );
        },
      ),
    );
  }
}
