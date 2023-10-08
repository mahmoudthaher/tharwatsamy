import 'package:bookly/Features/Home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/feature_list_view.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: kPaddingHomeView,
                  child: CustomAppBar(),
                ),
                const SizedBox(height: 8),
                const FeatureBooks(),
                const SizedBox(height: 50),
                Padding(
                  padding: kPaddingHomeView,
                  child:
                      Text(S.of(context).subTitle, style: Styles.textStyle18),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SliverPadding(
            padding: kPaddingHomeView,
            sliver: NewestBooksListView(),
          ),
        ],
      ),
    );
  }
}
