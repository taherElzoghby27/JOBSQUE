import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signout_state.dart';

class SignoutCubit extends Cubit<SignoutState> {
  SignoutCubit() : super(SignoutInitial());
}
