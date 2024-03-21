import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
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
        if (event is LoginEvent) {
          await loginEvent(emit, event);
        } else if (event is RegisterEvent) {
          await registerEvent(emit, event);
        }
      },
    );
  }

  Future<void> registerEvent(
      Emitter<AuthState> emit, RegisterEvent event) async {
    emit(RegisterLoading());
    Either<FailureServ, UserSignUp> result = await authRepo.register(
      name: event.name,
      email: event.email,
      password: event.password,
    );
    Future.delayed(Duration(seconds: 2));
    result.fold(
      (fail) {
        emit(RegisterFailure(message: fail.message));
      },
      (_user) {
        saveDataForUser(
          token: _user.token!,
          name: _user.data!.name,
          userId: _user.data!.id.toString(),
          email: _user.data!.email,
        );
        emit(RegisterLoaded());
      },
    );
  }

  Future<void> loginEvent(Emitter<AuthState> emit, LoginEvent event) async {
    emit(LoginLoading());
    Either<FailureServ, UserLogin> result = await authRepo.login(
      email: event.email,
      password: event.password,
    );
    Future.delayed(Duration(seconds: 2));
    result.fold(
      (fail) {
        emit(LoginFailure(message: fail.message));
      },
      (_user) {
        saveDataForUser(
          token: _user.token!,
          name: _user.user!.name!,
          userId: _user.user!.id.toString(),
          email: _user.user!.email!,
        );
        emit(LoginLoaded());
      },
    );
  }

  //save data for user
  saveDataForUser({
    required String userId,
    required String token,
    required String name,
    required String email,
  }) async {
    await CacheHelper.saveData(key: StringsEn.token, value: token);
    await CacheHelper.saveData(key: StringsEn.name, value: name);
    await CacheHelper.saveData(key: StringsEn.userId, value: userId);
    await CacheHelper.saveData(key: StringsEn.email, value: email);
  }
}
