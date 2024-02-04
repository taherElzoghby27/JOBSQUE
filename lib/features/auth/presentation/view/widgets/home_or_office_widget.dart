import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/bar_component.dart';
import 'package:jobsque/features/auth/presentation/view_model/work_location_cubit/work_location_cubit.dart';

class HomeOrOfficeWidget extends StatefulWidget {
  const HomeOrOfficeWidget({super.key});

  @override
  State<HomeOrOfficeWidget> createState() => _HomeOrOfficeWidgetState();
}

class _HomeOrOfficeWidgetState extends State<HomeOrOfficeWidget> {
  String type = StringsEn.remoteWork;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<WorkLocationCubit, WorkLocationState>(
      builder: (context, state) {
        return Container(
          height: size.height * .06.h,
          width: size.width * .85.w,
          decoration: AppConsts.barDecoration,
          child: Row(
            children: [
              Expanded(
                child: BarComponent(
                  title: StringsEn.workFromOffice,
                  color: type == StringsEn.workFromOffice
                      ? AppConsts.primary900
                      : AppConsts.neutral200,
                  onTap: () => BlocProvider.of<WorkLocationCubit>(context)
                      .changeWorkType(type: StringsEn.workFromOffice),
                ),
              ),
              Expanded(
                child: BarComponent(
                  title: StringsEn.remoteWork,
                  color: type == StringsEn.remoteWork
                      ? AppConsts.primary900
                      : AppConsts.neutral200,
                  onTap: () => BlocProvider.of<WorkLocationCubit>(context)
                      .changeWorkType(type: StringsEn.remoteWork),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is WorkLocationType) {
          type = state.typeWork;
        }
      },
    );
  }
}
