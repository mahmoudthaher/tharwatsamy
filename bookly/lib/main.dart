import 'package:bookly/Features/Home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/Home/presentation/manger/featured_books_bloc/featured_books_bloc.dart';
import 'package:bookly/Features/Home/presentation/manger/newest_books_bloc/newest_books_bloc.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/bloc/localization_bloc/localization_bloc.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_location.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:bookly/simple_bloc_observer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const BooklyApp(), // Wrap your app
  ));
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LocalizationBloc(),
            ),
            BlocProvider(
              create: (context) => FeaturedBooksBloc(
                getIt.get<HomeRepoImpl>(),
              )..add(FetchFeatureBooks()),
            ),
            BlocProvider(
              create: (context) => NewestBooksBloc(
                getIt.get<HomeRepoImpl>(),
              )..add(FetchNewest()),
            ),
          ],
          child: BlocBuilder<LocalizationBloc, UpdateLanguage>(
            builder: (context, state) {
              return MaterialApp.router(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: state.currentLanguage,
                builder: DevicePreview.appBuilder,
                routerConfig: AppRoute.router,
                debugShowCheckedModeBanner: false,
                theme: ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: kPrimaryColor,
                  textTheme: GoogleFonts.montserratTextTheme(
                    ThemeData.dark().textTheme,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
