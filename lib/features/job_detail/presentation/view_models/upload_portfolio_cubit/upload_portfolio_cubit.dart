import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jobsque/features/job_detail/data/models/Pdf.dart';

import '../../../../../core/consts/strings.dart';

part 'upload_portfolio_state.dart';

class UploadPortfolioCubit extends Cubit<UploadPortfolioState> {
  UploadPortfolioCubit() : super(UploadPortfolioInitial());
  List<Pdf> cvs = [];

  //AddFile
  addFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [StringsEn.pdfExtension],
      );
      if (cvs.length < 2 && result != null) {
        PlatformFile file = result.files.first;
        Pdf pdf = Pdf();
        pdf.name = file.name;
        pdf.bytes = file.bytes;
        pdf.size = megabyte(size: file.size);
        pdf.extension = file.extension ?? StringsEn.unKnown;
        pdf.path = file.path;
        cvs.add(pdf);
      } else {
        emit(PickedFileFailure(message: StringsEn.someThingError));
      }
      getFiles();
    } catch (error) {
      emit(PickedFileFailure(message: error.toString()));
    }
  }

//check have one save or more
  bool checkCvsIsCompletedOrNot() => cvs.length >= 1;
  //GetFiles
  getFiles() {
    try {
      emit(GetFilesLoading());
      List<Pdf> pdfCvs = cvs;
      emit(GetFilesSuccess(cvs: pdfCvs));
    } catch (error) {
      emit(GetFilesFailure(message: error.toString()));
    }
  }

  //convert bytes to megabytes
  double megabyte({required int size}) => cutNumber(size / 1024 / 1024);

  //convert double into 0.0
  double cutNumber(double number) => double.parse(number.toStringAsFixed(1));
}
