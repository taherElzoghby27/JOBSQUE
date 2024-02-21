import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jobsque/features/job_detail/data/models/Pdf.dart';

import '../../../../../core/consts/strings.dart';

part 'upload_portfolio_state.dart';

class UploadPortfolioCubit extends Cubit<UploadPortfolioState> {
  UploadPortfolioCubit() : super(UploadPortfolioInitial());
  List<Pdf> cvs = [];
  List<File> files = [];

  //AddFile
  addFile() async {
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
      getFiles();
    } catch (error) {
      emit(PickedFileFailure(message: error.toString()));
    }
  }

//check have one save or more
  bool checkCvsIsCompleted() => cvs.length == 2;

  //GetFiles
  getFiles() {
    try {
      emit(GetFilesLoading());
      List<Pdf> pdfCvs = [];
      pdfCvs.addAll(cvs);
      emit(GetFilesSuccess(cvs: pdfCvs));
    } catch (error) {
      emit(GetFilesFailure(message: error.toString()));
    }
  }

  //delete file
  deleteFile({required Pdf pdf}) async {
    cvs.remove(pdf);
    File file = filterFiles(pdf);
    files.remove(file);
    getFiles();
  }

  File filterFiles(Pdf pdf) => (files
      .where(
        (element) => element.path == pdf.path,
      )
      .toList())[0];

  //convert bytes to megabytes
  double megabyte({required int size}) => cutNumber(size / 1024 / 1024);

  //convert double into 0.0
  double cutNumber(double number) => double.parse(number.toStringAsFixed(1));
}
