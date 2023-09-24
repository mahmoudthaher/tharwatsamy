import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeatruedListViewItem extends StatelessWidget {
  const FeatruedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              AssetsData.imageLion,
            ),
          ),
        ),
      ),
    );
  }
}
