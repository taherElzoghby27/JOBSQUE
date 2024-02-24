import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/user_profile_model/portfolio.dart';

abstract class PortfolioRepo {
  //add portfolios
  Future<Either<FailureServ, PortfolioModel>> addPortFolio({
    required PortfolioModel portfolioCv,
  });

  //delete portfolios
  Future<Either<FailureServ, String>> deletePortFolio({
    required int idPortfolio,
  });
}
