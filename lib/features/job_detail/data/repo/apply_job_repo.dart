import 'package:dartz/dartz.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/features/auth/data/models/failure_message.dart';

abstract class ApplyUserRepo {
  Future<Either<FailureMessage, ApplyUser>> applyJob({
    required ApplyUser applyUser,
  });
}
