part of 'login_bloc.dart';

@immutable
abstract class LoginState extends BaseState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
