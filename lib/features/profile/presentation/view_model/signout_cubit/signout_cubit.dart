import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';

part 'signout_state.dart';

class SignoutCubit extends Cubit<SignoutState> {
  ProfileRepo profileRepo;
  SignoutCubit({
    required this.profileRepo,
  }) : super(SignoutInitial());
  //signout
  signOut() async {
    emit(SignOutLoading());
    bool isSignOut = await profileRepo.signOut();
    if (isSignOut) {
      emit(SignOutSucess());
    } else {
      emit(SignOutFailure());
    }
  }
}
