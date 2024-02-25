import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/features/home/data/repo/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final JobFilterRepo jobFilterRepo;
  TextEditingController titleJopCont = TextEditingController();
  TextEditingController locationCont = TextEditingController();
  String jopTimeType = StringsEn.fullTime;
  String salary = salaries[1];

  SearchCubit(this.jobFilterRepo) : super(SearchInitial());

  search({
    required String searchText,
    String location = '',
    String salary = '',
  }) async {
    //get all jobs
    emit(GetJobsLoading());
    Either<FailureServ, List<Job>> result = await jobFilterRepo.filterJobs(
      name: searchText,
      location: location,
      salary: salary,
    );
    result.fold(
      (failure) {
        emit(GetJobsFailure(message: failure.message));
      },
      (jobs) {
        emit(GetJobsLoaded(jobs: jobs));
      },
    );
  }

  ChangeSalary({required String value}) {
    salary = value;
    emit(ChangedSalaryState(salary: salary));
  }

  JopTimeTypeEvent({required String jopTimeType}) {
    //jop time type
    jopTimeType = jopTimeType;
    emit(ChangeJopTypeState(jopType: jopTimeType));
  }

  resetEvent() {
    titleJopCont.clear();
    locationCont.clear();
    jopTimeType = StringsEn.fullTime;
    salary = salaries[1];
  }

  showResult() {
    search(
      searchText: titleJopCont.text,
      location: locationCont.text,
    );
  }
}
