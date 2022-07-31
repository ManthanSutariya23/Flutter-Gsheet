import 'package:connect_google_excel/src/config/colors.dart';
import 'package:connect_google_excel/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget tagView(
    {@required String? title,
    Color? textColor,
    double? textSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? leftPadding,
    double? rightPadding,
    double? topPadding,
    double? bottomPadding,
    TextAlign? textAlignment}) {
  return Container(
    padding: EdgeInsets.only(
        left: leftPadding ?? 0,
        right: rightPadding ?? 15,
        top: topPadding ?? 0,
        bottom: bottomPadding ?? 0),
    child: Text(
      title!,
      textAlign: textAlignment ?? TextAlign.center,
      style: AppTextStyle.regularBold20.copyWith(
          color: textColor ?? AppColors.darkBlackColor,
          fontSize: textSize ?? Get.size.height/40,
          fontWeight: fontWeight ?? FontWeight.bold,
          letterSpacing: letterSpacing ?? 1),
    ),
  );
}
