import 'package:equatable/equatable.dart';

class LogInEntity extends Equatable {
  final String name;
  final String email;
  final String mobile;
  final String image;
  final int id;
  final bool is_verified;
  final String access_token;

  LogInEntity(
      { required this.name,
        required this.email,
        required this.mobile,
        required this.image,
        required this.id,
        required this.is_verified,
        required this.access_token});


  @override
  // TODO: implement props
  List<Object?> get props => [name, email, mobile, image, id, is_verified, access_token];

}
