import 'package:bookly/Features/Home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/feature_list_view.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/localization_bloc/localization_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';

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
                Padding(
                  padding: kPaddingHomeView,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<LocalizationBloc>(context)
                          .add(const ChangeLanguageEvent(Locale('ar')));
                    },
                    child: const CustomAppBar(),
                  ),
                ),
                const SizedBox(height: 8),
                const FeatureBooks(),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Padding(
                      padding: isArabic() ? kPaddingHomeView : kPaddingHomeView,
                      child: Text(S.of(context).subTitle,
                          style: Styles.textStyle18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: isArabic() ? 16 : 0,
                          right: isArabic() ? 0 : 16),
                      child: const Text('Test'),
                    ),
                    const Text('Locale'),
                  ],
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
