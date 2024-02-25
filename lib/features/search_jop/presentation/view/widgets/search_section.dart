import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/widgets/text_field.dart';

import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../view_model/search_bloc/search_cubit.dart';

class SectionSearch extends StatefulWidget {
  const SectionSearch({
    super.key,
    this.onChanged,
    this.controller,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<SectionSearch> createState() => _SectionSearchState();
}

class _SectionSearchState extends State<SectionSearch> {
  late SearchCubit bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<SearchCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.titleJopCont.dispose();
    bloc.titleJopCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///back
        IconButton(
          onPressed: () => GoRouter.of(context).pushReplacement(
            homePath,
            extra: 0,
          ),
          icon: Icon(Icons.arrow_back),
        ),

        ///search field
        Expanded(
          child: Padding(
            padding: AppConsts.padding10Horiz,
            child: CustomTextField(
              perfixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
              hint: StringsEn.typeSomething,
              border: AppConsts.normalBorderField.copyWith(
                borderRadius: BorderRadius.circular(35),
              ),
              onChanged: widget.onChanged,
              controller: widget.controller,
            ),
          ),
        ),
      ],
    );
  }
}
