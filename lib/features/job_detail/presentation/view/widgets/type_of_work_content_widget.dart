import 'package:flutter/material.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/item_cv_widget.dart';

class TypeOfWorkContentWidget extends StatefulWidget {
  const TypeOfWorkContentWidget({super.key});

  @override
  State<TypeOfWorkContentWidget> createState() =>
      _TypeOfWorkContentWidgetState();
}

class _TypeOfWorkContentWidgetState extends State<TypeOfWorkContentWidget> {
  List<String> cvs = [
    'Senior Ui Designer',
    'Graphic designer',
    'Senior Ux Designer',
    'Front End Developer',
  ];
  String group = 'cv';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ItemCvWidget(
        item: cvs[index],
        group: group,
        onChanged: (String? value) {
          setState(() => group = value!);
        },
      ),
      itemCount: cvs.length,
    );
  }
}
