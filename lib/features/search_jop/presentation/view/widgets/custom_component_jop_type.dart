import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/services/service_locator.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_type_jop_widget.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_bloc.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../home/data/repo/home_repo_implementation.dart';

class CustomComponentJopType extends StatelessWidget {
  const CustomComponentJopType({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsEn.jobType,
          style: AppConsts.style16White.copyWith(
            color: AppConsts.neutral900,
          ),
        ),
        SizedBox(height: size.height * .01.h),
        BlocProvider(
          create: (_) => SearchBloc(
            jobFilterRepo: getIt.get<FilterJobsRepoImplementation>(),
          ),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              SearchBloc bloc = BlocProvider.of<SearchBloc>(context);
              String fullTime = bloc.jopType;
              if (state is ChangeJopTypeState) {
                fullTime = state.jopType;
              }
              return Wrap(
                runSpacing: 10,
                spacing: 25,
                children: [
                  CustomTypeJopWidget(
                    label: StringsEn.fullTime,
                    labelColor: fullTime == StringsEn.fullTime
                        ? AppConsts.primary500
                        : AppConsts.neutral500,
                    onTap: () =>
                        bloc.add(JopTypeEvent(jopType: StringsEn.fullTime)),
                  ),
                  CustomTypeJopWidget(
                    label: StringsEn.remote,
                    labelColor: AppConsts.neutral500,
                    onTap: () {},
                  ),
                  CustomTypeJopWidget(
                    label: StringsEn.contract,
                    labelColor: AppConsts.neutral500,
                    onTap: () {},
                  ),
                  CustomTypeJopWidget(
                    label: StringsEn.partTime,
                    labelColor: fullTime == StringsEn.partTime
                        ? AppConsts.primary500
                        : AppConsts.neutral500,
                    onTap: () =>
                        bloc.add(JopTypeEvent(jopType: StringsEn.partTime)),
                  ),
                  CustomTypeJopWidget(
                    label: StringsEn.onSite,
                    labelColor: AppConsts.neutral500,
                    onTap: () {},
                  ),
                  CustomTypeJopWidget(
                    label: StringsEn.internship,
                    labelColor: AppConsts.neutral500,
                    onTap: () {},
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
