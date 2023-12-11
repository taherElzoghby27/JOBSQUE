import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/logo_title_icon_widget.dart';
import 'package:jobsque/core/widgets/type_jop_component.dart';

import 'custom_apply_job_process.dart';

class CustomItemAppliedJop extends StatelessWidget {
  const CustomItemAppliedJop({
    super.key,
    required this.logo,
    required this.jopTitle,
    required this.company,
    required this.country,
    required this.onTapBookMark,
    required this.onTap,
  });

  final String logo;
  final String jopTitle;
  final String company;
  final String country;
  final void Function() onTapBookMark;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 13 / 8,
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //logo jopName bookmark
              LogoTitleIconWidget(
                logo: logo,
                jopTitle: jopTitle,
                company: company,
                country: country,
                trailing: IconButton(
                  onPressed: onTapBookMark,
                  icon: Icon(
                    FontAwesomeIcons.bookmark,
                    color: AppConsts.neutral900,
                  ),
                ),
              ),
              //full time -remote -design
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TypeJopComponent(
                      label: StringsEn.fullTime,
                      color: AppConsts.primary500,
                    ),
                  ),
                  Expanded(
                    child: TypeJopComponent(
                      label: StringsEn.remote,
                      color: AppConsts.primary500,
                    ),
                  ),
                  //txt
                  Text(
                    'posted 2 days ago',
                    style: AppConsts.style12,
                  ),
                ],
              ),
              //completed or not
              CustomApplyJobProcess(),
            ],
          ),
        ),
      ),
    );
  }
}
