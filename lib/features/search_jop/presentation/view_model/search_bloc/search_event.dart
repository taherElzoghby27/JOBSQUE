part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchingEvent extends SearchEvent {
  final TextEditingController searchText;

  SearchingEvent({required this.searchText});
}
