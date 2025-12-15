import '../../domain/entities/login_entity.dart';

class LogInModel extends LogInEntity
{
  LogInModel({
    required String name,
    required String email,
    required String mobile,
    required String image,
    required int id,
    required bool is_verified,
    required String access_token
  }) : super(
      name: name,
      email: email,
      mobile: mobile,
      image: image,
      id: id,
      is_verified: is_verified,
      access_token: access_token);


  factory LogInModel.fromJson(Map<String,dynamic> json) {
    final user = json['data']['user'];
    return LogInModel(
      id: user['id'],
      name: user['name'],
      email: user['email'],
      mobile: user['mobile'],
      image: user['image'],
      is_verified: user['is_verified'],
      access_token: json['data']['access_token'],
    );
  }


  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'image': image,
      'is_verified': is_verified,
      'access_token': access_token,
    };
  }

}