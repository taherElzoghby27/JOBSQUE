part of 'update_name_pass_cubit.dart';

@immutable
abstract class UpdateNamePassState {}

class UpdateNamePassInitial extends UpdateNamePassState {}

//otp
class Fail extends UpdateNamePassState {
  final String message;

  Fail({required this.message});
}

class Loading extends UpdateNamePassState {}

class Success extends UpdateNamePassState {}

//update data
// class UpdatedFailure extends UpdateNamePassState {
//   final String message;
//
//   UpdatedFailure({required this.message});
// }
//
// class UpdatedLoading extends UpdateNamePassState {}
//
// class UpdatedSuccess extends UpdateNamePassState {}
