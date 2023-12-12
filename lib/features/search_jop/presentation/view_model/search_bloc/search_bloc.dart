import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/home/data/repo/home_repo.dart';

import '../../../../../core/models/job_model.dart';
import '../../../../auth/data/models/failure_message.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final JobFilterRepo jobFilterRepo;
  TextEditingController titleJopCont = TextEditingController();
  TextEditingController locationCont = TextEditingController();
  String jopType = StringsEn.fullTime;
  String salary = salaries[1];

  SearchBloc({required this.jobFilterRepo}) : super(SearchInitial()) {
    on<SearchEvent>(
      (event, emit) async {
        if (event is SearchingEvent) {
          //get all jobs
          emit(GetJobsLoading());
          Either<FailureMessage, List<Job>> result =
              await jobFilterRepo.filterJobs(name: event.searchText);
          result.fold(
            (failure) {
              emit(GetJobsFailure(message: failure.message!));
            },
            (jobs) {
              emit(GetJobsLoaded(jobs: jobs));
            },
          );
        } else if (event is JopTypeEvent) {
          jopType = event.jopType;
          print(jopType);
          emit(ChangeJopTypeState(jopType: event.jopType));
        } else if (event is ChangedSalaryEvent) {
          salary = event.value;
          print(salary);
          emit(ChangedSalaryState(salary: salary));
        } else if (state is showResultEvent) {
          //filter jobs
          emit(GetJobsLoading());
          Either<FailureMessage, List<Job>> result = await jobFilterRepo
              .filterJobs(name: titleJopCont.text, location: locationCont.text);
          result.fold(
            (failure) {
              emit(GetJobsFailure(message: failure.message!));
            },
            (jobs) {
              emit(GetJobsLoaded(jobs: jobs));
            },
          );
        }
      },
    );
  }

  //filter salary
  filterSalaryJobs({required List<Job> jobs}) {
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
  }
}
