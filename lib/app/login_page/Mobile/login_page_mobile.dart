import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/navigator.dart';
import '../../../constants.dart';
import '../../status.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';
import '../components/login_button.dart';
import '../components/password_input.dart';
import '../components/email_input.dart';

class LoginPageMobile extends StatelessWidget {
  const LoginPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.nextPage:
            Navigation.navigate(route: Constants.homeScreen, context: context);
            break;
          case Status.error:
            break;
        }
      },
      child: Center(
          child: Row(children: [
        const Expanded(flex: 5, child: SizedBox()),
        Expanded(
            flex: 90,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset('icon/logo.png')),
                      const Padding(padding: EdgeInsets.all(12)),
                      const EmailInput(),
                      const Padding(padding: EdgeInsets.all(12)),
                      const PasswordInput(),
                      const Padding(padding: EdgeInsets.all(12)),
                      const LoginButton(),
                    ],
                  )),
            )),
        const Expanded(flex: 5, child: SizedBox())
      ])),
    );
  }
}
