import 'package:connect_google_excel/src/config/colors.dart';
import 'package:connect_google_excel/src/config/text_style.dart';
import 'package:flutter/material.dart';

Widget drawerItem({
  @required BuildContext? context,
  @required String? title,
  @required IconData? icon,
  @required Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(
            icon!,
            color: AppColors.whiteColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title!,
            style: AppTextStyle.regular14.copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    ),
  );
}
