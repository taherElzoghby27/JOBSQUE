import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_filter_text_field.dart';

import '../../../../../../../../core/consts/strings.dart';
import '../../../../../../../../core/consts/style.dart';

class SelectVerifiMethod extends StatelessWidget {
  const SelectVerifiMethod({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .02.w),

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
        SizedBox(height: size.height * .02.w),
        //note
        Text(
          StringsEn.noteTurning,
          style: AppConsts.style16.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
