import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomTileSwitch extends StatelessWidget {
  const CustomTileSwitch({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    required this.styleText,
  });

  final String label;
  final TextStyle styleText;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * .6.w,
            child: Text(
              label,
              style: styleText,
            ),
          ),
          CupertinoSwitch(
            activeColor: AppConsts.primary500,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
