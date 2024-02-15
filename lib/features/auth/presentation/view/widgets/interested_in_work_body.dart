import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/customButton.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/section_type_job.dart';
import 'package:jobsque/features/auth/presentation/view_model/interested_in_work_cubit/interested_in_work_cubit.dart';

import 'work_interested_in_top_section.dart';

class InterestedInWorkBody extends StatefulWidget {
  const InterestedInWorkBody({super.key});

  @override
  State<InterestedInWorkBody> createState() => _InterestedInWorkBodyState();
}

class _InterestedInWorkBodyState extends State<InterestedInWorkBody> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///title in work interested in page
          TopSectionTitle(
            title: StringsEn.whatTypeOfWorkInterested,
            subTitle: StringsEn.tellUsWhatYouAreInterestedIn,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///type
          const SectionTypeJob(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          BlocConsumer<InterestedInWorkCubit, InterestedInWorkState>(
            listener: (context, state) {
              if (state is Success) {
                isLoading = false;
                GoRouter.of(context).pushReplacement(locationWorkPath);
              } else if (state is Loading) {
                isLoading = true;
              } else if (state is Failure) {
                isLoading = false;
                showSnack(
                  context,
                  message: StringsEn.whatTypeError,
                  background: AppConsts.danger500,
                );
              }
            },
            builder: (context, state) {
              return AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth,
                child: Visibility(
                  visible: !isLoading,
                  replacement: const LoadingWidget(),
                  child: CustomButton(
                    text: StringsEn.next,
                    onTap: () async {
                      await BlocProvider.of<InterestedInWorkCubit>(context)
                          .handleNextAction();
                    },
                  ),
                ),
              );
            },
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),
        ],
      ),
    );
  }
}
