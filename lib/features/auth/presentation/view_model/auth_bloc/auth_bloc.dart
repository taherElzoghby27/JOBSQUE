import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/auth/data/models/failure_message.dart';
import 'package:jobsque/features/auth/data/models/user_create/user_model.dart';
import 'package:jobsque/features/auth/data/models/user_login/user_login.dart';
import 'package:jobsque/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        ///login
        if (event is LoginEvent) {
          emit(LoginLoading());
          Either<FailureMessage, UserLogin> result = await authRepo.login(
            email: event.email,
            password: event.password,
          );
          result.fold(
            (fail) {
              emit(LoginFailure(message: fail.message!));
            },
            (_user) {
              saveDataForUser(
                token: _user.token!,
                name: _user.user!.name!,
                userId: _user.user!.id.toString(),
              );
              emit(LoginLoaded());
            },
          );
        } else if (event is RegisterEvent) {
          ///register
          emit(RegisterLoading());
          Either<FailureMessage, UserSignUp> result = await authRepo.register(
            name: event.name,
            email: event.email,
            password: event.password,
          );
          result.fold(
            (fail) {
              emit(RegisterFailure(message: fail.message!));
            },
            (user) {
              saveDataForUser(
                token: user.token!,
                name: user.data!.name,
                userId: user.data!.id.toString(),
              );
              emit(RegisterLoaded());
            },
          );
        }
      },
    );
  }

  //save data for user
  saveDataForUser({
    required String userId,
    required String token,
    required String name,
  }) async {
    await CacheHelper.saveData(key: StringsEn.token, value: token);
    await CacheHelper.saveData(key: StringsEn.name, value: name);
    await CacheHelper.saveData(key: StringsEn.userId, value: userId);
  }
}
