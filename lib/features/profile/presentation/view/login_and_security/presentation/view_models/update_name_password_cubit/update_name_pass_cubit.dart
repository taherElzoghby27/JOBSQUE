import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/models/user_model_updated.dart';
import 'package:jobsque/features/profile/presentation/view/login_and_security/data/repo/login_security_repo.dart';

part 'update_name_pass_state.dart';

class UpdateNamePassCubit extends Cubit<UpdateNamePassState> {
  LoginAndSecurityRepo loginAndSecurityRepo;

  UpdateNamePassCubit({
    required this.loginAndSecurityRepo,
  }) : super(UpdateNamePassInitial());
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  String? email;
  String? name;
  String? pass;

  changeData({required String value, required String status}) {
    status == StringsEn.email
        ? email = value
        : status == StringsEn.name
            ? name = value
            : pass = value;
  }

//get otp
  getOtp() async {
    if (keyForm.currentState!.validate()) {
      emit(Loading());
      Either<Failure, String> result = await loginAndSecurityRepo.getOtp(
        email: email!,
      );
      result.fold(
        (fail) => emit(
          Fail(message: fail.message),
        ),
        (success) {
          emit(Success());
        },
      );
    }
  }

//update name & pass
  updateNamePass() async {
    if (keyForm.currentState!.validate()) {
      emit(Loading());
      Either<Failure, UserModelUpdated> result =
          await loginAndSecurityRepo.updateNamePass(
        name: name!,
        password: pass!,
      );
      updateCache(name!);
      result.fold(
        (fail) => emit(
          Fail(message: StringsEn.someThingError),
        ),
        (success) {
          emit(Success());
        },
      );
    }
  }

//update cache
  updateCache(String name) async {
    await CacheHelper.saveData(key: StringsEn.name, value: name);
  }
}
