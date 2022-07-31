
import 'package:connect_google_excel/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

record() {
  return Container(
    width: Get.size.width,
    alignment: Alignment.center,
    child: Text('No Record Found',style: AppTextStyle.regular16.copyWith(fontWeight: FontWeight.bold))
  );
}

