import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'apply_job_event.dart';

part 'apply_job_state.dart';

class ApplyJobBloc extends Bloc<ApplyJobEvent, ApplyJobState> {
  int currentPage = 1;

  ApplyJobBloc() : super(ApplyJobInitial()) {
    on<ApplyJobEvent>(
      (event, emit) {
        if (event is NextOrSubmitEvent) {
          if (currentPage == 1) {
            currentPage = 2;
          } else if (currentPage == 2) {
            currentPage = 3;
          }
          emit(ChangedPageState());
        }
      },
    );
  }
}
