part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchingEvent extends SearchEvent {
  final String searchText;
  final String location;
  final String salary;

  SearchingEvent({
    required this.searchText,
    this.location = '',
    this.salary = '',
  });
}

class ChangedSalaryEvent extends SearchEvent {
  final String value;

  ChangedSalaryEvent({required this.value});
}

class JopTimeTypeEvent extends SearchEvent {
  final String jopTimeType;

  JopTimeTypeEvent({required this.jopTimeType});
}

class ResetEvent extends SearchEvent {}

class showResultEvent extends SearchEvent {}
