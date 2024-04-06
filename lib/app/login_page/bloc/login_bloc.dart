import 'package:bloc/bloc.dart';
import 'package:nymblelabs_music/data/signup_repository.dart';
import '../../../data/login_repository.dart';
import '../../status.dart';
import 'login_state.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
      {required LoginRepository loginRepository,
      required SignUpRepository signUpRepository})
      : _loginRepository = loginRepository,
        _signUpRepository = signUpRepository,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<SignUpEnabled>(_onSignUpOpened);
  }

  final LoginRepository _loginRepository;
  final SignUpRepository _signUpRepository;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    if (event.email.isEmpty) {
      emit(
        state.copyWith(
          email: event.email,
          emailError: "Email can't be empty",
        ),
      );
    } else if (event.email.length < 8) {
      emit(
        state.copyWith(
          email: event.email,
          emailError: "Email should be more than 6 characters",
        ),
      );
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(event.email)) {
      emit(
        state.copyWith(
          email: event.email,
          emailError: "Invalid Email Id",
        ),
      );
    } else {
      emit(
        state.copyWith(
          email: event.email,
          emailError: "",
        ),
      );
    }
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    // final username = event.username;
    if (event.password.isEmpty) {
      emit(
        state.copyWith(
          password: event.password,
          passwordError: "Password can't be empty",
        ),
      );
    } else if (event.password.length < 8) {
      emit(
        state.copyWith(
          password: event.password,
          passwordError: "Password should be more than 8 characters",
        ),
      );
    } else {
      emit(
        state.copyWith(
          password: event.password,
          passwordError: "",
        ),
      );
    }
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    if (event.isSignUp) {
      try {
        await _signUpRepository.signUp();
        emit(state.copyWith(
          status: Status.nextPage,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: Status.error,
        ));
      }
    } else {
      try {
        await _loginRepository.login();
        emit(state.copyWith(
          status: Status.nextPage,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: Status.error,
        ));
      }
    }
  }

  void _onSignUpOpened(SignUpEnabled event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      status: Status.signUp,
    ));
  }
}
