import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/services/service_locator.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_type_jop_widget.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_cubit.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../home/data/repo/home_repo_implementation.dart';

class CustomComponentJopType extends StatelessWidget {
  const CustomComponentJopType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsEn.jobType,
          style: AppConsts.style16White.copyWith(
            color: AppConsts.neutral900,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
        BlocProvider(
          create: (_) => SearchCubit(
            getIt.get<FilterJobsRepoImplementation>(),
          ),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              SearchCubit bloc = BlocProvider.of<SearchCubit>(context);
              String fullTime = bloc.jopTimeType;
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
                    onTap: () => bloc.JopTimeTypeEvent(
                      jopTimeType: StringsEn.fullTime,
                    ),
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
                    onTap: () => bloc.JopTimeTypeEvent(
                      jopTimeType: StringsEn.partTime,
                    ),
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
