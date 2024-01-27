import 'package:flutter/widgets.dart';
import 'package:jobsque/core/consts/fake_data.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_divider.dart';

import 'custom_item_language.dart';

class SectionLangugaes extends StatefulWidget {
  const SectionLangugaes({super.key});

  @override
  State<SectionLangugaes> createState() => _SectionLangugaesState();
}

class _SectionLangugaesState extends State<SectionLangugaes> {
  String group = StringsEn.England;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => CustomItemLanguage(
        logo: languages[index][StringsEn.logo]!,
        label: languages[index][StringsEn.name]!,
        value: languages[index][StringsEn.name]!,
        group: group,
        onChanged: (v) {
          setState(() => group = v!);
        },
      ),
      itemCount: languages.length,
      separatorBuilder: (BuildContext context, int index) => CustomDivider(),
    );
  }
}
