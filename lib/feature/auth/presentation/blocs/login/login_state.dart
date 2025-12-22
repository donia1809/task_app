part of 'login_bloc.dart';

abstract class LogInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LogInState {}

class LoginLoadingState extends LogInState {}


class LoginSuccessState extends LogInState
{
  final LogInEntity client;

  LoginSuccessState({required this.client});

  @override
  List<Object?> get props => [client];
}

class LoginErrorState extends LogInState
{
  final String message;

  LoginErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}


