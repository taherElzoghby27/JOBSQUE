import 'package:jobsque/core/models/user_profile_model/portfolio.dart';
import 'package:jobsque/features/auth/data/models/user_create/profile_model.dart';

class UserProfileModel {
  List<PortfolioModel>? portfolio;
  Profile? profile;

  UserProfileModel({this.portfolio, this.profile});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['portfolio'] != null) {
      portfolio = <PortfolioModel>[];
      json['portfolio'].forEach((v) {
        portfolio!.add(PortfolioModel.fromJson(v));
      });
    }
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }
}
