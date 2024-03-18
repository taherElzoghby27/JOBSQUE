// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/user_profile_model/portfolio.dart';
import 'package:jobsque/core/models/user_profile_model/user_profile_portolio_model.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';

import '../../../data/repo/portfolio_repo.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepo portfolioRepo;
  final ProfileRepo profileRepo;

  PortfolioCubit({
    required this.portfolioRepo,
    required this.profileRepo,
  }) : super(PortfolioInitial());

  //to save
  List<File> files = [];

  //add portfolio
  addPortfolio() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [StringsEn.pdfExtension],
      );
      if (result != null) {
        File cvFile = File(result.files.first.path!);
        files.add(cvFile);
        add(file: cvFile);
      } else {
        emit(PickedFileFailure(message: StringsEn.noFileSelected));
      }
    } catch (error) {
      emit(PickedFileFailure(message: error.toString()));
    }
  }

  //add portfolio
  add({required File file}) async {
    Either<FailureServ, PortfolioModel> portfolio =
        await portfolioRepo.addPortFolio(
      portfolioCv: PortfolioModel(
        cvFile: file,
        image: file,
      ),
    );

    portfolio.fold(
      (l) => print("added failed"),
      (r) async {
        await CacheHelper.saveData(
          key: StringsEn.portfolioCompleteK,
          value: true,
        );
        getPortfolios();
        print("added success");
      },
    );
  }

  //get portfolios
  getPortfolios() async {
    emit(GetFilesLoading());
    Either<FailureServ, UserProfilePortfolioModel> portfolios =
        await profileRepo.getProfile();
    portfolios.fold(
      (failure) {
        emit(GetFilesFailure(message: failure.message));
      },
      (success) {
        emit(GetFilesSuccess(cvs: success.portfolio));
      },
    );
  }

  //delete portfolios
  deletePortfolio({required int idPortfolio}) async {
    emit(DeletedLoading());
    Either<FailureServ, String> result = await portfolioRepo.deletePortFolio(
      idPortfolio: idPortfolio,
    );
    result.fold(
      (failure) {
        emit(DeletedFailure(message: failure.message));
      },
      (message) async {
        await getPortfolios();
        emit(DeletedSuccess(message: message));
      },
    );
  }
}
