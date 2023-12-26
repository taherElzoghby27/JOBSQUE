import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/changed_page_cubit/changed_page_cubit.dart';

part 'bio_data_state.dart';

class BioDataCubit extends Cubit<BioDataState> {
  BioDataCubit() : super(BioDataInitial());

  GlobalKey<FormState> keyFormApplyJop1 = GlobalKey<FormState>();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController phoneCont = TextEditingController();
  String codeCountry = "+20";

//check fields is valid or not
  checkFieldsIsValidOrNot(BuildContext context) {
    if (keyFormApplyJop1.currentState!.validate()) {
      BlocProvider.of<ChangedPageCubit>(context).currentPage = 2;
    }
  }

//check phone number
  bool checkPhoneNumber() =>
      '+${phoneCont.text}'.startsWith(codeCountry) ? true : false;

//on changed counry
  onChangedCountry({required CountryCode code}) =>
      codeCountry = code.dialCode.toString();
}
