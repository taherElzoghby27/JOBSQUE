import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/features/complete_profile/presentation/view/widgets/fields_education_page.dart';
import 'package:jobsque/features/complete_profile/presentation/view_models/add_education_cubit/add_education_cubit.dart';

import '../../../../../core/widgets/small_loading_widget.dart';

class CustomEducationComponent extends StatefulWidget {
  const CustomEducationComponent({super.key});

  @override
  State<CustomEducationComponent> createState() =>
      _CustomEducationComponentState();
}

class _CustomEducationComponentState extends State<CustomEducationComponent> {
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppConsts.decorationRadius8,
      child: Padding(
        padding: AppConsts.allPadding8,
        child: Column(
          children: [
            const FieldsEducationPage(), //save
            Center(
              child: AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth,
                child: BlocConsumer<AddEducationCubit, AddEducationState>(
                  builder: (context, state) {
                    return Visibility(
                      visible: !isLoad,
                      replacement: const LoadingWidget(),
                      child: CustomButton(
                        text: StringsEn.save,
                        onTap: () =>
                            BlocProvider.of<AddEducationCubit>(context).save(),
                      ),
                    );
                  },
                  listener: (context, state) {
                    if (state is AddedSuccessfullyState) {
                      isLoad = false;
                    } else if (state is AddedLoadingState) {
                      isLoad = true;
                    } else if (state is AddedFailureState) {
                      isLoad = false;
                      showSnack(
                        context,
                        message: state.message,
                        background: AppConsts.danger500,
                      );
                    }
                  },
                ),
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          ],
        ),
      ),
    );
  }
}
