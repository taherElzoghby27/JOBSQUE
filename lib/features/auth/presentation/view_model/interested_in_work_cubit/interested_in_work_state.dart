part of 'interested_in_work_cubit.dart';

@immutable
abstract class InterestedInWorkState {}

class InterestedInWorkInitial extends InterestedInWorkState {}

class InterestedWorkState extends InterestedInWorkState {
  InterestedWorkState();
}

class Loading extends InterestedInWorkState {}

class Success extends InterestedInWorkState {}

class Failure extends InterestedInWorkState {}
