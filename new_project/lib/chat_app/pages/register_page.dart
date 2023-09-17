// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_project/chat_app/Constants.dart';
import 'package:new_project/chat_app/pages/chat_page.dart';
import 'package:new_project/chat_app/pages/cubit/auth_cubit/auth_cubit.dart';
import 'package:new_project/chat_app/widgets/custom_button.dart';
import 'package:new_project/chat_app/widgets/custom_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisteLoading) {
          isLoading = true;
        } else if (state is RegisteSuccess) {
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoading = false;
        } else if (state is RegisteFailuer) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                    Image.asset('lib/chat_app/assets/images/scholar.png'),
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
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormTextField(
                        obscureText: true,
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password'),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      text: 'Registor',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context)
                              .registerUser(email: email!, password: password!);
                        }
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have an account ? ',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          child: Text(
                            'Login in',
                            style: TextStyle(color: Color(0xffC7EDE6)),
                          ),
                          onTap: () {
                            Navigator.pop(context);
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
        );
      },
    );
  }
}
