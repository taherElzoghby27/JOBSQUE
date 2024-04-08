import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/job_detail/presentation/view_models/changed_page_cubit/changed_page_cubit.dart';

part 'bio_data_state.dart';

class BioDataCubit extends Cubit<BioDataState> {
  BioDataCubit() : super(BioDataInitial());

  GlobalKey<FormState> keyFormApplyJop1 = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  String _codeCountry = "+20";

  //name
  set name(TextEditingController name) {
    this._name = name;
  }

  TextEditingController get name => this._name;

  //email
  set email(TextEditingController email) {
    this._email = email;
  }

  TextEditingController get email => this._email;

  //phone
  set phone(TextEditingController phone) {
    this._phone = phone;
  }

  TextEditingController get phone => this._phone;

  //code country
  set codeCountry(String codeCountry) {
    this._codeCountry = codeCountry;
  }

  String get codeCountry => this._codeCountry;

//check fields is valid or not
  checkFieldsIsValidOrNot(BuildContext context) {
    if (keyFormApplyJop1.currentState!.validate()) {
      BlocProvider.of<ChangedPageCubit>(context).currentPage = 2;
    }
  }

//on changed country
  onChangedCountry({required CountryCode code}) =>
      codeCountry = code.dialCode.toString();
}
