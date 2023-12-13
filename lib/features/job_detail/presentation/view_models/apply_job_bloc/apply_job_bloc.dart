import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'apply_job_event.dart';
part 'apply_job_state.dart';

class ApplyJobBloc extends Bloc<ApplyJobEvent, ApplyJobState> {
  ApplyJobBloc() : super(ApplyJobInitial()) {
    on<ApplyJobEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
