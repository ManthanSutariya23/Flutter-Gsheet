import 'package:connect_google_excel/src/config/colors.dart';
import 'package:connect_google_excel/src/constant/credential.dart';
import 'package:connect_google_excel/src/widget/comman_widget/button_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        width: Get.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            buttonView(
              title: "Click",
              onPressed: () {
                FlutterSheet.display();
              }
            ),
          ],
        ),
      ),
    );
  }
}

