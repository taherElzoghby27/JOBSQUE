import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
}
