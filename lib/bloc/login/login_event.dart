part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginInputEvent extends LoginEvent {
  const LoginInputEvent({required this.request});

  final LoginRequest request;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
