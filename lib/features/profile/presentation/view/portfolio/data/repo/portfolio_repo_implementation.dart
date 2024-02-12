
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/models/portfolio.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/repo/portfolio_repo.dart';

import '../../../../../../../core/consts/api_service.dart';
import '../../../../../../../core/services/remote_datasource/profile_service/add_portfolio_service.dart';

class PortfolioRepoImplementation extends PortfolioRepo {
  ApiService apiService;
  AddPortfolioService addPortfolioService;

  PortfolioRepoImplementation({
    required this.apiService,
    required this.addPortfolioService,
  });

  @override
  Future<Either<FailureServ, UserProfilePortfolioModel>> getPortFolio() async {
    try {
      Map<String, dynamic> result = await apiService.get(
        path:
            "${ApiConsts.getPortfolioEndPoint}?user_id=${CacheHelper.getData(key: StringsEn.userId)}",
      );
      //success
      UserProfilePortfolioModel profileUser =
          UserProfilePortfolioModel.fromJson(result["data"]);
      return Right(profileUser);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<FailureServ, PortfolioCv>> addPortFolio({
    required PortfolioCv portfolioCv,
  }) async {
    try {
      Map<String, dynamic> result =
          await addPortfolioService.addPortfolio(portfolioCv: portfolioCv);
        PortfolioCv portfolio = PortfolioCv.fromJson(result["data"]);
        return Right(portfolio);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  void deletePortFolio() {
    //
  }
}
