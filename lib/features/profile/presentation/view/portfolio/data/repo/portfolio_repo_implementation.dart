// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/core/services/api_service/profile_service/get_profile_service.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/models/portfolio.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/repo/portfolio_repo.dart';

class PortfolioRepoImplementation extends PortfolioRepo {
  GetProfileService getProfileService;
  PortfolioRepoImplementation({required this.getProfileService});
  @override
  Future<Either<FailureMessage, UserProfilePortfolioModel>>
      getPortFolio() async {
    try {
      http.Response result = await getProfileService.getProfile(
        urlPath: "${ApiConsts.url}${ApiConsts.getPortfolioEndPoint}",
      );
      Map<String, dynamic> data = jsonDecode(result.body);

      if (result.statusCode == 200) {
        print("success");
        //success
        UserProfilePortfolioModel profileUser =
            UserProfilePortfolioModel.fromJson(data["data"]);
        return Right(profileUser);
      } else {
        //fail
        FailureMessage failModel = FailureMessage.fromJson(data);
        return Left(failModel);
      }
    } catch (error) {
      print("fail2");
      return Left(FailureMessage(message: error.toString()));
    }
  }

  @override
  Future<Either<FailureMessage, PortfolioCv>> addPortFolio() {
    throw UnimplementedError();
  }

  @override
  void deletePortFolio() {
    //
  }
}
