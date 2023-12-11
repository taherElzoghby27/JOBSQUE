part of 'interested_in_work_cubit.dart';

@immutable
abstract class InterestedInWorkState {}

class InterestedInWorkInitial extends InterestedInWorkState {}

class UiUxDesigner extends InterestedInWorkState {
  final bool status;

  UiUxDesigner({required this.status});
}

class IllustratorDesigner extends InterestedInWorkState {
  final bool status;

  IllustratorDesigner({required this.status});
}

class Developer extends InterestedInWorkState {
  final bool status;

  Developer({required this.status});
}

class Management extends InterestedInWorkState {
  final bool status;

  Management({required this.status});
}

class InformationTechnology extends InterestedInWorkState {
  final bool status;

  InformationTechnology({required this.status});
}

class ResearchAndAnalytics extends InterestedInWorkState {
  final bool status;

  ResearchAndAnalytics({required this.status});
}
