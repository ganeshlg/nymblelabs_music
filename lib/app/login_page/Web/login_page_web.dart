import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/navigator.dart';
import 'package:nymblelabs_music/app/status.dart';
import 'package:nymblelabs_music/constants.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';
import '../components/login_button.dart';
import '../components/password_input.dart';
import '../components/email_input.dart';

class LoginPageWeb extends StatelessWidget {
  const LoginPageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.nextPage:
            Navigation.navigate(
                route: Constants.homeScreen,
                context: context,
                email: state.email);
            break;
          case Status.error:
            var snackBar = SnackBar(
              content: Text(
                state.loginError.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              duration: const Duration(milliseconds: 810),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            break;
          case Status.signUpSuccess:
            var snackBar = const SnackBar(
              content: Text(
                "Email registered successfully, please login...",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              duration: Duration(milliseconds: 810),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            break;
        }
      },
      child: Center(
          child: SizedBox(
              width: Constants.mobileWidth,
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/icon/logo.png')),
                        const Padding(padding: EdgeInsets.all(12)),
                        const EmailInput(),
                        const Padding(padding: EdgeInsets.all(12)),
                        const PasswordInput(),
                        const Padding(padding: EdgeInsets.all(12)),
                        const LoginButton(),
                      ],
                    )),
              ))),
    );
  }
}
