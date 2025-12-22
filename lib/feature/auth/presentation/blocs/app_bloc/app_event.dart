part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStartedEvent extends AppEvent {}

class AppLoggedInEvent extends AppEvent {
  final String accessToken;

  AppLoggedInEvent({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}

class AppLoggedOutEvent extends AppEvent {}

class AppContinueAsGuestEvent extends AppEvent {}
