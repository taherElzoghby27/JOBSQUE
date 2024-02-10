import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/core/services/remote_datasource/jop_service/filter_job_service.dart';

import '../../../../core/errors/failure_message.dart';
import 'home_repo.dart';

class FilterJobsRepoImplementation implements JobFilterRepo {
  final JobApiService jobApiService;

  FilterJobsRepoImplementation({required this.jobApiService});

  @override
  Future<Either<Failure, List<Job>>> filterJobs({
    String name = '',
    String location = '',
    String salary = '',
  }) async {
    try {
      //response
      Map<String, dynamic> result = await jobApiService.FilterJobApi(
        name: name,
        location: location,
        salary: salary,
      );
      //convert data from List<dynamic> to List<job>
      List<Job> jobs = (result['data'] as List)
          .map(
            (job) => Job.fromJson(job),
          )
          .toList();
      print("jobs:$jobs");
      return Right(jobs);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
