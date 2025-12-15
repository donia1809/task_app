
import '../../domain/entities/otp_entity.dart';

class OtpModel extends OtpEntity {
  OtpModel({required int status, required String message})
      : super(status: status, message: message);

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }

}
