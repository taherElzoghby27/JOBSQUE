import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/assets.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/custom_circle_button.dart';
import 'package:jobsque/core/widgets/text_field.dart';

import '../../../../../core/consts/strings.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.allPadding15,
      child: Column(
        children: [
          ///hi <name>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${StringsEn.hi}$name',
                      style: AppConsts.style24,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      StringsEn.createBetterFuture,
                      style: AppConsts.style14.copyWith(
                        color: AppConsts.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomCircleButton(
                  icon: AppAssets.notification,
                  onTap: () => GoRouter.of(context).push(notificationPath),
                ),
              ),
            ],
          ),

          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///search field
          CustomTextField(
            perfixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
            hint: StringsEn.search,
            readOnly: true,
            onTap: () => GoRouter.of(context).push(searchPath),
            border: AppConsts.normalBorderField.copyWith(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ],
      ),
    );
  }
}
