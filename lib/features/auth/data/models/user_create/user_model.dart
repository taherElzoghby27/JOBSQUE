
import 'package:jobsque/features/auth/data/models/user_create/profile_model.dart';

import 'data_model.dart';

class UserSignUp {
  Data? data;
  Profile? profile;
  String? token;

  UserSignUp({this.data, this.profile, this.token});

  UserSignUp.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    profile = Profile.fromJson(json['profile']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJsonRigester();
    }
    return data;
  }
}
