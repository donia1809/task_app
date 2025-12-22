part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppInitialState extends AppState {}

class AppUnAuthenticatedState extends AppState {
  final String message;

  AppUnAuthenticatedState({required this.message});

  @override
  List<Object?> get props => [message];
}

class AppAuthenticatedState extends AppState {
  final String accessToken;

  AppAuthenticatedState({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}

class AppGuestState extends AppState {}
