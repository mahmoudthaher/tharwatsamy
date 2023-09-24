import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(height: 8),
          FeatureBooks(),
        ],
      ),
    );
  }
}

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
            padding: EdgeInsets.only(right: 16),
            child: FeatruedListViewItem(),
          );
        },
      ),
    );
  }
}
