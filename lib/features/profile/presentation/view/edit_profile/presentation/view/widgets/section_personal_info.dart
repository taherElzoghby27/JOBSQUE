import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_filter_text_form_field.dart';
import 'package:jobsque/features/profile/presentation/view/edit_profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';

class SectionPersonalInfo extends StatelessWidget {
  const SectionPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    EditProfileCubit bloc = BlocProvider.of<EditProfileCubit>(context);
    return Form(
      key: bloc.keyForm,
      child: ListView(
        children: [
          //bio
          CustomFilterTextFormField(
            label: StringsEn.bio,
            hint: StringsEn.bio,
            controller: bloc.bio,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          //address
          CustomFilterTextFormField(
            label: StringsEn.address,
            hint: StringsEn.address,
            controller: bloc.address,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          //no handphone
          CustomFilterTextFormField(
            label: StringsEn.noHandPhone,
            hint: StringsEn.phone,
            perfixIcon: CountryCodePicker(
              initialSelection: StringsEn.eg,
              flagWidth: 25,
              onChanged: (CountryCode code) =>
                  bloc.onChangedCountry(code: code),
              showDropDownButton: true,
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              showFlagDialog: true,
              hideMainText: true,
              showFlagMain: true,
            ),
            controller: bloc.mobileNumber,
            codeCountry: bloc.codeCountry,
          ),
        ],
      ),
    );
  }
}
