import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/login_page/Mobile/login_page_mobile.dart';
import 'package:nymblelabs_music/constants.dart';
import 'package:nymblelabs_music/data/signup_repository.dart';
import '../../data/login_repository.dart';
import 'Web/login_page_web.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginRepository loginRepository = LoginRepository();
  final SignUpRepository signUpRepository = SignUpRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (_) => LoginBloc(loginRepository: loginRepository, signUpRepository: signUpRepository),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > Constants.mobileWidth) {
                  return const LoginPageWeb();
                } else {
                  return const LoginPageMobile();
                }
              },
            )));
  }
}
