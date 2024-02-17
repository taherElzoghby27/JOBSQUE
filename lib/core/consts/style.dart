import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppConsts {
  static const Color neutral900 = Color.fromRGBO(17, 24, 39, 1);
  static const Color neutral800 = Color.fromRGBO(31, 41, 55, 1);
  static const Color neutral700 = Color.fromRGBO(55, 65, 81, 1);
  static const Color neutral600 = Color.fromRGBO(75, 85, 99, 1);
  static const Color neutral500 = Color.fromRGBO(107, 114, 128, 1);
  static const Color neutral400 = Color.fromRGBO(156, 163, 175, 1);
  static const Color neutral300 = Color.fromRGBO(209, 213, 219, 1);
  static const Color neutral200 = Color.fromRGBO(229, 231, 235, 1);
  static const Color neutral100 = Color.fromRGBO(244, 244, 245, 1);
  static const Color primary900 = Color.fromRGBO(9, 26, 122, 1);
  static const Color primary800 = Color.fromRGBO(16, 38, 147, 1);
  static const Color primary700 = Color.fromRGBO(25, 57, 183, 1);
  static const Color primary600 = Color.fromRGBO(37, 78, 219, 1);
  static const Color primary500 = Color.fromRGBO(51, 102, 255, 1);
  static const Color primary400 = Color.fromRGBO(102, 144, 255, 1);
  static const Color primary300 = Color.fromRGBO(132, 169, 255, 1);
  static const Color primary200 = Color.fromRGBO(173, 200, 255, 1);
  static const Color primary100 = Color.fromRGBO(214, 228, 255, 1);
  static const Color success900 = Color.fromRGBO(13, 95, 9, 1);
  static const Color success800 = Color.fromRGBO(27, 114, 15, 1);
  static const Color success700 = Color.fromRGBO(46, 142, 24, 1);
  static const Color success600 = Color.fromRGBO(69, 170, 35, 1);
  static const Color success500 = Color.fromRGBO(96, 198, 49, 1);
  static const Color success400 = Color.fromRGBO(143, 220, 96, 1);
  static const Color success300 = Color.fromRGBO(178, 237, 130, 1);
  static const Color success200 = Color.fromRGBO(212, 249, 174, 1);
  static const Color success100 = Color.fromRGBO(236, 252, 214, 1);
  static const Color information900 = Color.fromRGBO(2, 51, 122, 1);
  static const Color information800 = Color.fromRGBO(3, 72, 147, 1);
  static const Color information700 = Color.fromRGBO(6, 101, 183, 1);
  static const Color information600 = Color.fromRGBO(8, 135, 219, 1);
  static const Color information500 = Color.fromRGBO(12, 174, 255, 1);
  static const Color information400 = Color.fromRGBO(72, 205, 255, 1);
  static const Color information300 = Color.fromRGBO(109, 225, 255, 1);
  static const Color information200 = Color.fromRGBO(157, 241, 255, 1);
  static const Color information100 = Color.fromRGBO(206, 251, 255, 1);
  static const Color warning900 = Color.fromRGBO(122, 93, 3, 1);
  static const Color warning800 = Color.fromRGBO(147, 116, 6, 1);
  static const Color warning700 = Color.fromRGBO(183, 147, 10, 1);
  static const Color warning600 = Color.fromRGBO(219, 180, 14, 1);
  static const Color warning500 = Color.fromRGBO(255, 215, 20, 1);
  static const Color warning400 = Color.fromRGBO(255, 228, 78, 1);
  static const Color warning300 = Color.fromRGBO(255, 235, 114, 1);
  static const Color warning200 = Color.fromRGBO(255, 243, 161, 1);
  static const Color warning100 = Color.fromRGBO(255, 250, 208, 1);
  static const Color danger900 = Color.fromRGBO(122, 8, 29, 1);
  static const Color danger800 = Color.fromRGBO(147, 13, 27, 1);
  static const Color danger700 = Color.fromRGBO(183, 21, 25, 1);
  static const Color danger600 = Color.fromRGBO(219, 41, 31, 1);
  static const Color danger500 = Color.fromRGBO(255, 71, 43, 1);
  static const Color danger400 = Color.fromRGBO(255, 129, 96, 1);
  static const Color danger300 = Color.fromRGBO(255, 164, 127, 1);
  static const Color danger200 = Color.fromRGBO(255, 201, 170, 1);
  static const Color danger100 = Color.fromRGBO(255, 231, 212, 1);

  //aspect ratio
  static const double aspect16on2 = 16 / 2;
  static const double aspect16on14 = 16 / 14;
  static const double aspect16on1 = 16 / 1;
  static const double aspect20on36 = 20 / 36;
  static const double aspect20on2 = 20 / 2;
  static const double aspect16on4 = 16 / 4;
  static const double aspect16on5 = 16 / 5;
  static const double aspect16on3 = 16 / 3;
  static const double aspect16on8 = 16 / 8;
  static const double aspect40on1 = 40 / 1;
  static const double aspect300on1 = 300 / 1;
  static const double aspectRatioButtonAuth = 3 / .4;
  static const double aspectRatioButtonApply = 2.1 / .65;
  static const double aspect13on8 = 13 / 8;
  static const double aspect13on9 = 13 / 9;
  static const double aspect13on10 = 13 / 10;
  static const double aspect13on5 = 13 / 5;
  static const double aspect10on19 = 10 / 19;
  static const double aspect16on7 = 16 / 7;
  static const double halfScreenHeight = 565;

  //padding
  static const EdgeInsets mainPadding = EdgeInsets.symmetric(horizontal: 15);
  static const EdgeInsets padding10 = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsets padding10h8v = EdgeInsets.symmetric(horizontal: 10,vertical: 8);
  static const EdgeInsets allPadding8 = EdgeInsets.all(8);
  static const EdgeInsets verticalPadding5 = EdgeInsets.symmetric(vertical: 5);

  //styles
  static const TextStyle styleHint14 = TextStyle(
    color: AppConsts.neutral400,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static const TextStyle style14Bubble = TextStyle(
    color: AppConsts.neutral800,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static const TextStyle style20 = TextStyle(
    color: AppConsts.neutral100,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static const TextStyle style24 = TextStyle(
    color: AppConsts.neutral900,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static const TextStyle style28 = TextStyle(
    color: AppConsts.neutral900,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static const TextStyle style12 = TextStyle(
    color: AppConsts.neutral600,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static const TextStyle style14 = TextStyle(
    color: AppConsts.neutral400,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static const TextStyle style16 = TextStyle(
    color: AppConsts.neutral500,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static const TextStyle style16White = TextStyle(
    color: AppConsts.neutral100,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );

  static const TextStyle style32 = TextStyle(
    color: AppConsts.neutral900,
    fontSize: 32,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static const TextStyle style16Error = TextStyle(
    color: AppConsts.danger500,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    fontStyle: FontStyle.normal,
  );
  static OutlineInputBorder normalBorderField = OutlineInputBorder(
    borderRadius: BorderRadius.circular(13.sp),
    borderSide: BorderSide(color: neutral300, width: 1),
  );
  static BoxDecoration decorationLoadingMap = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: neutral200.withOpacity(.2),
  );
  static OutlineInputBorder focusedBorderField = OutlineInputBorder(
    borderRadius: BorderRadius.circular(13.sp),
    borderSide: BorderSide(color: primary500, width: 1),
  );
  static OutlineInputBorder errorBorderField = OutlineInputBorder(
    borderRadius: BorderRadius.circular(13.sp),
    borderSide: BorderSide(color: danger500, width: 1),
  );
  static BoxDecoration borderButton = BoxDecoration(
    border: Border.all(color: AppConsts.neutral300),
    borderRadius: BorderRadius.circular(12),
  );
  static BoxDecoration decorationSheet = BoxDecoration(
    color: AppConsts.neutral100,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.sp),
      topRight: Radius.circular(30.sp),
    ),
  );
  static BoxDecoration decorationCircleNotCheck = BoxDecoration(
    color: AppConsts.neutral100.withOpacity(0),
    borderRadius: BorderRadius.circular(50.sp),
    border: Border.all(color: AppConsts.neutral400),
  );
  static BoxDecoration decorationCircleDone = BoxDecoration(
    color: AppConsts.primary500,
    borderRadius: BorderRadius.circular(50.sp),
  );
  static BoxDecoration decorationRadius8 = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: AppConsts.neutral300),
  );
  static BoxDecoration decorationChatBubble = BoxDecoration(
    color: AppConsts.neutral200,
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(8),
      bottomLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
  );
  static BoxDecoration decorationChatBubbleForFriend = BoxDecoration(
    color: AppConsts.primary500,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(8),
      topLeft: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  );
  static BoxDecoration decorationPhoto = BoxDecoration(
    border: Border.all(width: 4, color: AppConsts.neutral100),
    borderRadius: BorderRadius.circular(90),
  );
  static BoxDecoration decorationBlur = BoxDecoration(
    borderRadius: BorderRadius.circular(90),
    color: AppConsts.neutral700.withOpacity(.5),
  );
  static BoxDecoration barDecoration = BoxDecoration(
    color: AppConsts.neutral200,
    borderRadius: BorderRadius.circular(40.sp),
  );
  static BoxDecoration decorationNeutral300border16 = BoxDecoration(
    color: AppConsts.neutral300,
    borderRadius: BorderRadius.circular(16),
  );
  static BoxDecoration decorationNeutral400border16 = BoxDecoration(
    color: AppConsts.neutral400,
    borderRadius: BorderRadius.circular(16),
  );
}
