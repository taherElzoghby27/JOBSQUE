import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/home/data/repo/home_repo.dart';

import '../../../../../core/models/job_model/job_model.dart';
import '../../../../../core/errors/failure_message.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final JobFilterRepo jobFilterRepo;
  TextEditingController titleJopCont = TextEditingController();
  TextEditingController locationCont = TextEditingController();
  String jopTimeType = StringsEn.fullTime;
  String salary = salaries[1];

  SearchBloc({required this.jobFilterRepo}) : super(SearchInitial()) {
    on<SearchEvent>(
      (event, emit) async {
        if (event is SearchingEvent) {
          //get all jobs
          emit(GetJobsLoading());
          Either<FailureMessage, List<Job>> result =
              await jobFilterRepo.filterJobs(
            name: event.searchText,
            location: event.location,
            salary: event.salary,
          );
          result.fold(
            (failure) {
              emit(GetJobsFailure(message: failure.message!));
            },
            (jobs) {
              emit(GetJobsLoaded(jobs: jobs));
            },
          );
        } else if (event is JopTimeTypeEvent) {
          //jop time type
          jopTimeType = event.jopTimeType;
          emit(ChangeJopTypeState(jopType: event.jopTimeType));
        } else if (event is ChangedSalaryEvent) {
          //jop salary
          salary = event.value;
          emit(ChangedSalaryState(salary: salary));
        } else if (event is showResultEvent) {
          SearchingEvent(
            searchText: titleJopCont.text,
            location: locationCont.text,
          );
          //filter jobs
          // emit(GetJobsLoading());
          // Either<FailureMessage, List<Job>> result = await jobFilterRepo
          //     .filterJobs(name: titleJopCont.text, location: locationCont.text);
          // result.fold(
          //   (failure) {
          //     emit(GetJobsFailure(message: failure.message!));
          //   },
          //   (jobs) {
          //     List<Job> jobsAfterFiltering = filterSalaryJobs(jobs: jobs);
          //     print(jobsAfterFiltering);
          //     emit(GetJobsLoaded(jobs: jobsAfterFiltering));
          //   },
          // );
        } else if (event is ResetEvent) {
          titleJopCont.clear();
          locationCont.clear();
          salary = salaries[1];
          emit(ResetState());
        }
      },
    );
  }

  //filter salary
  List<Job> filterSalaryJobs({required List<Job> jobs}) {
    List<Job> jobsFiltered = [];
    if (salary == salaries[0]) {
      jobsFiltered =
          jobs.where((job) => int.parse(job.salary!) <= 5000).toList();
    } else if (salary == salaries[1]) {
      jobsFiltered = jobs
          .where((job) =>
              int.parse(job.salary!) >= 5000 && int.parse(job.salary!) <= 10000)
          .toList();
    } else if (salary == salaries[2]) {
      jobsFiltered = jobs
          .where((job) =>
              int.parse(job.salary!) >= 10000 &&
              int.parse(job.salary!) <= 15000)
          .toList();
    } else if (salary == salaries[3]) {
      jobsFiltered = jobs
          .where((job) =>
              int.parse(job.salary!) >= 15000 &&
              int.parse(job.salary!) <= 20000)
          .toList();
    } else if (salary == salaries[4]) {
      jobsFiltered = jobs
          .where((job) =>
              int.parse(job.salary!) >= 20000 &&
              int.parse(job.salary!) <= 25000)
          .toList();
    } else if (salary == salaries[5]) {
      jobsFiltered =
          jobs.where((job) => int.parse(job.salary!) >= 25000).toList();
    }
    return jobsFiltered;
  }
}
