import 'package:equatable/equatable.dart';
import 'package:nymblelabs_music/app/status.dart';

final class LoginState extends Equatable {
  const LoginState(
      {this.status = Status.initial,
      this.email = "",
      this.password = "",
      this.emailError,
      this.passwordError,
      this.loginError});

  final String status;
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final String? loginError;

  LoginState copyWith(
      {String? status,
      String? email,
      String? password,
      String? emailError,
      String? passwordError,
      String? loginError}) {
    return LoginState(
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password,
        emailError: emailError ?? this.emailError,
        passwordError: passwordError ?? this.passwordError,
        loginError: loginError ?? this.loginError);
  }

  @override
  List<Object> get props => [status, email, password];
}
