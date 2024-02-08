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
import 'package:jobsque/features/profile/presentation/view/portfolio/data/models/portfolio.dart';

import '../../../data/repo/portfolio_repo.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepo portfolioRepo;

  PortfolioCubit({required this.portfolioRepo}) : super(PortfolioInitial());

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
        emit(PickedFileFailure(message: StringsEn.someThingError));
      }
    } catch (error) {
      emit(PickedFileFailure(message: error.toString()));
    }
  }

  //add portfolio
  add({required File file}) async {
    Either<FailureMessage, PortfolioCv> portfolio =
        await portfolioRepo.addPortFolio(
      portfolioCv: PortfolioCv(cvFile: file, image: file),
    );
    getPortfolios();
    portfolio.fold(
      (l) => print("added failed"),
      (r) async {
        await CacheHelper.saveData(
          key: StringsEn.portfolioComplete,
          value: true,
        );
        print("added success");
      },
    );
  }

  //get portfolios
  getPortfolios() async {
    try {
      emit(GetFilesLoading());
      Either<FailureMessage, UserProfilePortfolioModel> portfolio =
          await portfolioRepo.getPortFolio();
      portfolio.fold(
        (fail) => emit(GetFilesFailure(message: StringsEn.someThingError)),
        (portfolioCv) => emit(GetFilesSuccess(cvs: portfolioCv.portfolio)),
      );
    } catch (error) {
      emit(GetFilesFailure(message: StringsEn.someThingError));
    }
  }

  //delete portfolios
  deletePortfolio() {}
}
