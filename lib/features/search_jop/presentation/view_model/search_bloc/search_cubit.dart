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
  TextEditingController _titleJob = TextEditingController();
  TextEditingController _location = TextEditingController();
  String _jopTimeType = StringsEn.fullTime;
  String _salary = salaries[1];

  TextEditingController get titleJob => _titleJob;

  TextEditingController get location => _location;

  String get jopTimeType => _jopTimeType;

  String get salary => _salary;

  // Setters for updating the values
  set jobTitle(TextEditingController newValue) => this._titleJob = newValue;

  set location(TextEditingController newValue) => this._location = newValue;

  set jopTimeType(String newValue) => _jopTimeType = newValue;

  set salary(String newValue) => _salary = newValue;

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
    jopTimeType = jopTimeType;
    emit(ChangeJopTypeState(jopType: jopTimeType));
  }

  resetEvent() {
    titleJob.clear();
    location.clear();
    JopTimeTypeEvent(jopTimeType: StringsEn.fullTime);
    ChangeSalary(value: salaries[1]);
    //emit(ResetState());
  }

  showResult() {
    search(
      searchText: titleJob.text,
      location: location.text,
    );
  }
}
