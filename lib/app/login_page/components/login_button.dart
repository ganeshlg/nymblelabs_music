import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants.dart';
import '../../navigator.dart';
import '../../status.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status == Status.loading
            ? CircularProgressIndicator(color: Theme.of(context).primaryColor,)
            : Column(children: [
                Row(children: [
                  Expanded(
                      child: ElevatedButton(
                    key: const Key('LOGIN_BUTTON'),
                    onPressed:
                        (state.emailError == "" && state.passwordError == "")
                            ? () {
                                context
                                    .read<LoginBloc>()
                                    .add(const LoginSubmitted(true));
                              }
                            : null,
                    child: Text(
                      state.status == Status.signUp
                          ? "Sign Up and Login to your account"
                          : 'Login',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.apply(color: Colors.white),
                    ),
                  ))
                ]),
                state.status == Status.signUp
                    ? const Padding(padding: EdgeInsets.all(0))
                    : Column(children: [
                        const Padding(padding: EdgeInsets.all(12)),
                        const Text("Don't have an account?"),
                        const Padding(padding: EdgeInsets.all(12)),
                        Row(children: [
                          Expanded(
                              child: ElevatedButton(
                            key: const Key('SIGNUP_BUTTON'),
                            onPressed: () {
                              context
                                  .read<LoginBloc>()
                                  .add(const SignUpEnabled());
                            },
                            child: Text('Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.apply(color: Colors.white)),
                          ))
                        ])
                      ])
              ]);
      },
    );
  }
}
