import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/user_profile_model/portfolio.dart';
import 'package:jobsque/core/services/remote_datasource/profile_service/delete_portfolio_service.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/repo/portfolio_repo.dart';
import '../../../../../../../core/services/remote_datasource/profile_service/add_portfolio_service.dart';

class PortfolioRepoImplementation extends PortfolioRepo {
  AddPortfolioService addPortfolioService;
  DeletePortfolioService deletePortfolioService;

  PortfolioRepoImplementation({
    required this.addPortfolioService,
    required this.deletePortfolioService,
  });

  @override
  Future<Either<FailureServ, PortfolioModel>> addPortFolio({
    required PortfolioModel portfolioCv,
  }) async {
    try {
      Map<String, dynamic> result = await addPortfolioService.addPortfolio(
        portfolioCv: portfolioCv,
      );
      PortfolioModel portfolio = PortfolioModel.fromJson(result["data"]);
      return Right(portfolio);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<FailureServ, String>> deletePortFolio({
    required int idPortfolio,
  }) async {
    try {
      Map<String, dynamic> result =
          await deletePortfolioService.deletePortfolio(
        idPortfolio: idPortfolio,
      );
      return Right(result["massage"]);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
