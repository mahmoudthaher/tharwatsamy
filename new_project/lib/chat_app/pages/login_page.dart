// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_project/chat_app/Constants.dart';
import 'package:new_project/chat_app/pages/chat_page.dart';
import 'package:new_project/chat_app/pages/cubit/bloc/auth_bloc/auth_bloc.dart';
import 'package:new_project/chat_app/pages/cubit/chat_cubit/chat_cubit.dart';
import 'package:new_project/chat_app/pages/register_page.dart';
import 'package:new_project/chat_app/widgets/custom_button.dart';
import 'package:new_project/chat_app/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = 'LoginPage';
  String? email, password;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoading = false;
        } else if (state is LoginFailuer) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: KPrimaryColor,
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Image.asset(KLogo),
                  const Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    hintText: 'Email',
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    hintText: 'Password',
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                            LoginEvent(email: email!, password: password!));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'dont have an account ? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Color(0xffC7EDE6)),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
