import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/features/job_detail/data/models/Pdf.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial());
  List<Pdf> cvs = [];
  List<File> files = [];

  //add portfolio
  addPortfolio() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [StringsEn.pdfExtension],
      );
      if (cvs.length < 2 && result != null) {
        File cvFile = File(result.files.first.path!);
        PlatformFile file = result.files.first;
        Pdf pdf = Pdf();
        pdf.name = file.name;
        pdf.bytes = file.bytes;
        pdf.size = megabyte(size: file.size);
        pdf.extension = file.extension ?? StringsEn.unKnown;
        pdf.path = file.path;
        cvs.add(pdf);
        files.add(cvFile);
      } else {
        emit(PickedFileFailure(message: StringsEn.someThingError));
      }
      getPortfolios();
    } catch (error) {
      emit(PickedFileFailure(message: error.toString()));
    }
  }

  //get portfolios
  getPortfolios() {
    try {
      emit(GetFilesLoading());
      List<Pdf> pdfCvs = cvs;
      emit(GetFilesSuccess(cvs: pdfCvs));
    } catch (error) {
      emit(GetFilesFailure(message: error.toString()));
    }
  }

  //check have one save or more
  bool checkCvsIsCompleted() => cvs.length == 2;

  //convert bytes to megabytes
  double megabyte({required int size}) => cutNumber(size / 1024 / 1024);

  //convert double into 0.0
  double cutNumber(double number) => double.parse(number.toStringAsFixed(1));

  //delete portfolios
  deletePortfolio() {}
}
