import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/home/data/repo/home_repo.dart';

import '../../../../../core/models/job_model.dart';
import '../../../../auth/data/models/failure_message.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final JobFilterRepo jobFilterRepo;
  String titleJop = '';
  String location = '';
  String jopType = StringsEn.fullTime;

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
        }
      },
    );
  }
}
