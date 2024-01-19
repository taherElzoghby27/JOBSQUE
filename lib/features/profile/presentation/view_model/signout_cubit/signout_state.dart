part of 'signout_cubit.dart';

sealed class SignoutState extends Equatable {
  const SignoutState();

  @override
  List<Object> get props => [];
}

final class SignoutInitial extends SignoutState {}
