import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/work_interested_in_top_section.dart';
import 'package:jobsque/features/auth/presentation/view_model/work_location_cubit/work_location_cubit.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/customButton.dart';
import 'all_countries.dart';
import 'home_or_office_widget.dart';

class WorkLocationBody extends StatefulWidget {
  const WorkLocationBody({super.key});

  @override
  State<WorkLocationBody> createState() => _WorkLocationBodyState();
}

class _WorkLocationBodyState extends State<WorkLocationBody> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///title in location work in page
          TopSectionTitle(
            title: StringsEn.whereAreYouLocation,
            subTitle: StringsEn.letUsKnowWhereIsTheWork,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///home or office
          const HomeOrOfficeWidget(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              StringsEn.selectCountrForJop,
              style: AppConsts.style16,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect40on1),

          ///countries
          const AllCountryWidget(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///next
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: BlocConsumer<WorkLocationCubit, WorkLocationState>(
              listener: (context, state) {
                if (state is InterestedInWorkLoading) {
                  loading = true;
                } else if (state is InterestedInWorkSuccess) {
                  loading = false;
                  GoRouter.of(context).pushReplacement(
                    successfullyPagePath,
                    extra: {
                      StringsEn.icon: AppAssets.user,
                      StringsEn.title: StringsEn.yourAccountHasBeenSetUp,
                      StringsEn.subTitle: StringsEn.weHaveCustomizedFeeds,
                      StringsEn.labelButton: StringsEn.getStarted,
                      StringsEn.path: homePath,
                    },
                  );
                } else if (state is InterestedInWorkFailure) {
                  showSnack(
                    context,
                    message: StringsEn.whereAreYouLocationerror,
                  );
                }
              },
              builder: (context, state) {
                return Visibility(
                  visible: !loading,
                  replacement: const LoadingWidget(),
                  child: CustomButton(
                    text: StringsEn.next,
                    onTap: () async {
                      await BlocProvider.of<WorkLocationCubit>(context)
                          .handleNextAction();
                    },
                  ),
                );
              },
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        ],
      ),
    );
  }
}
