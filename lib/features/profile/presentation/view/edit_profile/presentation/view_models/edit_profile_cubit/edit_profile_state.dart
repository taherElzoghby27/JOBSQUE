part of 'edit_profile_cubit.dart';

abstract class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

class SavedLoading extends EditProfileState {}

class SavedSuccess extends EditProfileState {}

class SavedFailure extends EditProfileState {
  final String message;

  SavedFailure({required this.message});
}
