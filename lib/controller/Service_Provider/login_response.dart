import 'package:bams_project/controller/Service_Provider/user_Service.dart';

class LoginResponse {
  final User user;
  final String token;

  LoginResponse({required this.user, required this.token});
  factory LoginResponse.fromjson(Map<String, dynamic> json) =>
      LoginResponse(user: User.fromjson(json), token: json['token']);
}
