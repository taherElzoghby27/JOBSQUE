import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';
import 'package:jobsque/features/complete_profile/presentation/view_models/add_education_cubit/add_education_cubit.dart';

class FieldsEducationPage extends StatefulWidget {
  const FieldsEducationPage({super.key});

  @override
  State<FieldsEducationPage> createState() => _FieldsEducationPageState();
}

class _FieldsEducationPageState extends State<FieldsEducationPage> {
  late AddEducationCubit bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<AddEducationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //university
        CustomFilterTextField(
          label: StringsEn.university,
          star: StringsEn.star,
          hint: StringsEn.university,
          controller: bloc.university,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //title
        CustomFilterTextField(
          label: StringsEn.title,
          hint: StringsEn.title,
          controller: bloc.title,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
      ],
    );
  }
}
