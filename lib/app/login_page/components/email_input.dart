import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('EMAIL'),
          onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email)),
            cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              labelText: 'Email',
              errorText: state.emailError != "" ? state.emailError : null,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1.0),
              )
          ),
          style: Theme.of(context).textTheme.bodyMedium
        );
      },
    );
  }
}
