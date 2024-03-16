import 'package:jobsque/core/models/user_profile_model/portfolio.dart';
import 'package:jobsque/core/models/user_profile_model/profile.dart';

class UserProfilePortfolioModel {
  List<PortfolioModel>? portfolio;
  Profile? profile;

  UserProfilePortfolioModel({this.portfolio, this.profile});

  UserProfilePortfolioModel.fromJson(Map<String, dynamic> json) {
    portfolio = json['portofolio'] == null
        ? []
        : List<PortfolioModel>.from(
            (json['portofolio'] as List<dynamic>).map(
              (e) => PortfolioModel.fromJson(e),
            ),
          );
    profile = json['profile'] != null
        ? new Profile.fromJson(
            json['profile'],
          )
        : null;
  }
}
