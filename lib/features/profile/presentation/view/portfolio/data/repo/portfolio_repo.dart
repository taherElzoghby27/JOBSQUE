import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/models/portfolio.dart';

abstract class PortfolioRepo {
  //get portfolios
  Future<Either<FailureServ, UserProfilePortfolioModel>> getPortFolio();
  //add portfolios
  Future<Either<FailureServ, PortfolioCv>> addPortFolio({
    required PortfolioCv portfolioCv,
  });
  //delete portfolios
  void deletePortFolio();
}
