part of 'work_location_cubit.dart';

@immutable
abstract class WorkLocationState {}

class WorkLocationInitial extends WorkLocationState {}

class WorkLocationType extends WorkLocationState {
  final String typeWork;

  WorkLocationType({required this.typeWork});
}

class InterestedInWorkState extends WorkLocationState {}
