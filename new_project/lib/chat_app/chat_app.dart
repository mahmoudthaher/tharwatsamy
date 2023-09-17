import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_project/chat_app/pages/chat_page.dart';
import 'package:new_project/chat_app/pages/cubit/auth_cubit/auth_cubit.dart';
import 'package:new_project/chat_app/pages/cubit/bloc/auth_bloc/auth_bloc.dart';
import 'package:new_project/chat_app/pages/cubit/chat_cubit/chat_cubit.dart';
import 'package:new_project/chat_app/pages/login_page.dart';
import 'package:new_project/chat_app/pages/register_page.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        // BlocProvider(
        //   create: (context) => RegisterCubit(),
        // ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage()
        },
        initialRoute: LoginPage.id,
        builder: EasyLoading.init(),
      ),
    );
  }
}
