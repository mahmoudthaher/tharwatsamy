import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/feature_list_view.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: kPaddingHomeView,
                  child: CustomAppBar(),
                ),
                SizedBox(height: 8),
                FeatureBooks(),
                SizedBox(height: 50),
                Padding(
                  padding: kPaddingHomeView,
                  child: Text('Best Seller', style: Styles.textStyle18),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverPadding(
            padding: kPaddingHomeView,
            sliver: BestSellerListView(),
          ),
        ],
      ),
    );
  }
}
