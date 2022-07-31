import 'package:connect_google_excel/src/config/colors.dart';
import 'package:flutter/material.dart';

Widget dotView({
  @required BuildContext? context,
  @required int? dotindex,
}) {
  return Container(
    padding: const EdgeInsets.only(right: 10),
    child: Icon(
      Icons.circle,
      color: dotindex == 0
          ? AppColors.primaryPurpleColor
          : dotindex == 1
              ? AppColors.primaryPurpleColor
              : dotindex == 2
                  ? AppColors.primaryPurpleColor
                  : AppColors.primaryGreyColor,
      size: dotindex == 0 ? 15 : 10,
    ),
  );
}
