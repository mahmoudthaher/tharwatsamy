import 'package:bookly/core/models/language_model/language_model.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/bloc/localization_bloc/localization_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsData.logo,
          height: 18,
        ),
        const Spacer(),
        DropdownButton(
          underline: const SizedBox(),
          icon: const Icon(
            Icons.language,
            size: 30,
            color: Colors.white,
          ),
          items: LanguageModel.languageList()
              .map(
                (lang) => DropdownMenuItem(
                  value: lang.languageCode,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(lang.name),
                      Text(lang.flag),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            BlocProvider.of<LocalizationBloc>(context)
                .add(ChangeLanguageEvent(Locale(value.toString())));
          },
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoute.kSearchView);
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22,
          ),
        )
      ],
    );
  }
}
