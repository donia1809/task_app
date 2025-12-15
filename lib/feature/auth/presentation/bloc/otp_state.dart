part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoadingState extends OtpState {}

class OtpSuccessState extends OtpState
{
  final OtpEntity client;

  OtpSuccessState({required this.client});

  @override
  List<Object?> get props => [client];
}

class OtpErrorState extends OtpState {
  final String message;

  OtpErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}