import 'package:jobsque/features/auth/data/models/user_login/user.dart';

class UserLogin {
  User? user;
  String? token;
  bool? status;

  UserLogin({this.user, this.token, this.status});

  UserLogin.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
