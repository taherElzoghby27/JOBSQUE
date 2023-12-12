part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchingEvent extends SearchEvent {
  final String searchText;

  SearchingEvent({required this.searchText});
}

class ChangedSalaryEvent extends SearchEvent {
  final String value;

  ChangedSalaryEvent({required this.value});
}

class JopTypeEvent extends SearchEvent {
  final String jopType;

  JopTypeEvent({required this.jopType});
}

class ResetEvent extends SearchEvent {}
// class showResultEvent extends SearchEvent {
//   final String title;
//   final String location;
// }
