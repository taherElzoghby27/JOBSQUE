import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/features/home/data/repo/home_repo.dart';

import '../../../../core/services/api_service/jop_service/filter_job_service.dart';
import '../../../../core/errors/failure_message.dart';

class FilterJobsRepoImplementation implements JobFilterRepo {
  final JobApiService jobApiService;

  FilterJobsRepoImplementation({required this.jobApiService});

  @override
  Future<Either<FailureMessage, List<Job>>> filterJobs({
    String name = '',
    String location = '',
    String salary = '',
  }) async {
    try {
      //response
      http.Response result = await jobApiService.FilterJobApi(
        name: name,
        location: location,
        salary: salary,
      );
      //convert data from json to map
      Map<String, dynamic> data = jsonDecode(result.body);
      //success
      if (result.statusCode == 200) {
        //convert data from List<Map> to List<job>
        List<Job> jobs = List<Job>.from(
          (data['data'] as List).map(
            (job) => Job.fromJson(job),
          ),
        );
        print(jobs);
        return Right(jobs);
      } else if (result.statusCode == 401) {
        //failure

        return Left(FailureMessage(message: result.body.toString()));
      }
    } catch (e) {
      //failure
      return Left(FailureMessage(message: e.toString()));
    }
    return Left(FailureMessage(message: 'something error'));
  }
}
