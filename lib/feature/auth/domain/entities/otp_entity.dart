import 'package:equatable/equatable.dart';

class OtpEntity extends Equatable {
  final int status;
  final String message;

  const OtpEntity({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
