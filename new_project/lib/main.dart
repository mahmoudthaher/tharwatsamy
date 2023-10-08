import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/3%20project/basketball_point_counter_app.dart';
import 'package:new_project/3%20project/business_card_app.dart';
import 'package:new_project/chat_app/chat_app.dart';
import 'package:new_project/firebase_options.dart';
import 'package:new_project/language_learning_app/main_page.dart';
import 'package:new_project/3%20project/tunes_page.dart';
import 'package:new_project/news_app/news_app.dart';
import 'package:new_project/simple_bloc_observer.dart';
import 'package:new_project/weather_app/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = SimpleBlocObserver();
  runApp(const ChatApp());
}
