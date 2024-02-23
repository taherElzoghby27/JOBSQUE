import 'package:dartz/dartz.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/errors/failure_message.dart';

abstract class ApplyUserRepo {
  Future<Either<FailureServ, void>> applyJobRemote({
    required ApplyUser applyUser,
  });

  Future<Either<String, String>> applyJobLocal({
    required ApplyUser applyUser,
  });
}
