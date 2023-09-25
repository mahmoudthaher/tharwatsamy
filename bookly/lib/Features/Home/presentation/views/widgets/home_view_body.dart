import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/feature_list_view.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SizedBox(height: 8),
            FeatureBooks(),
            SizedBox(height: 50),
            Text('Best Seller', style: Styles.textStyle18),
            SizedBox(height: 20),
            BestSellerListViewItem(),
          ],
        ),
      ),
    );
  }
}
