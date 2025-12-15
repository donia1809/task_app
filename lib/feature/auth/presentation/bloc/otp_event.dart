part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable
{
  @override
  List<Object?> get props => [];
}

class VerifyOtpEvent extends OtpEvent
{
  final String otp;
  final String accessToken;

  VerifyOtpEvent({
    required this.otp,
    required this.accessToken,
  });

  @override
  List<Object?> get props => [otp, accessToken];
}