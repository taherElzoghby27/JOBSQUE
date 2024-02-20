import 'package:flutter/material.dart';
import 'package:jobsque/core/widgets/custom_filter_text_field.dart';

import '../../../../../../../../core/consts/strings.dart';
import '../../../../../../../../core/consts/style.dart';

class SelectVerifiMethod extends StatelessWidget {
  const SelectVerifiMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on2),

        //Select a verification method
        CustomFilterTextField(
          label: StringsEn.selectVerification,
          suffixIcon: DropdownButton<String>(
            hint: Text('\t\t\t\t\t${StringsEn.telephoneNumber}'),
            underline: Container(),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            items: [
              DropdownMenuItem<String>(
                value: StringsEn.telephoneNumber,
                child: Text(StringsEn.telephoneNumber),
                onTap: () {},
              ),
            ],
            onChanged: (String? value) {},
          ),
          readOnly: true,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //note
        Text(
          StringsEn.noteTurning,
          style: AppConsts.style16.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
