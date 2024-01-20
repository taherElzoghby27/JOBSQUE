part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

class SavedLoading extends EditProfileState {}

class SavedSuccess extends EditProfileState {}

class SavedFailure extends EditProfileState {}
