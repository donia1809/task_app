part of 'login_bloc.dart';

abstract class LogInEvent extends Equatable
{
  @override
  List<Object?> get props => [];
}

class LoginWithMobileEvent extends LogInEvent
{
  final String mobile;

  LoginWithMobileEvent({required this.mobile});

  @override
  List<Object?> get props => [mobile];
}
