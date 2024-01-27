import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';

abstract class PortfolioRepo {
  //get portfolios
  Future<Either<FailureMessage, UserProfilePortfolioModel>> getPortFolio();
}
