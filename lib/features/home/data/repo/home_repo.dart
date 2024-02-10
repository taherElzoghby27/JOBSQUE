import 'package:dartz/dartz.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';

import '../../../../core/errors/failure_message.dart';

abstract class JobFilterRepo {
  Future<Either<Failure, List<Job>>> filterJobs({
    String name = '',
    String location = '',
    String salary = '',
  });
}
