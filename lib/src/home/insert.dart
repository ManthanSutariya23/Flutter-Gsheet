import 'package:connect_google_excel/src/config/colors.dart';
import 'package:connect_google_excel/src/constant/credential.dart';
import 'package:connect_google_excel/src/constant/sheetscolumn.dart';
import 'package:connect_google_excel/src/controller/insert_controller.dart';
import 'package:connect_google_excel/src/widget/comman_widget/appbar.dart';
import 'package:connect_google_excel/src/widget/comman_widget/button_view.dart';
import 'package:connect_google_excel/src/widget/comman_widget/textview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Insert extends StatefulWidget {
  const Insert({Key? key}) : super(key: key);

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  var frmkey1 = GlobalKey<FormState>();
  final InsertController _controller = Get.put(InsertController());
  bool loader = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.nameFocus.value.unfocus();
        _controller.countryFocus.value.unfocus();
        _controller.feedbackFocus.value.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: appBar(context: context, title: "Insert Data",),
        body: SingleChildScrollView(
          child: Container(
            height: Get.size.height - 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Column(
                children: [

                  SizedBox(
                    height: Get.size.height * 0.2,
                  ),

                  Container(
                    child: textView(
                      context: context,
                      labelText: "Name",
                      hintText: "Enter Name",
                      controller: _controller.nameController.value,
                      focusNode: _controller.nameFocus.value,
                    ),
                  ),

                  SizedBox(
                    height: Get.size.height * 0.02,
                  ),

                  Container(
                    child: textView(
                      context: context,
                      labelText: "Country",
                      hintText: "Enter Country",
                      controller: _controller.countryController.value,
                      focusNode: _controller.countryFocus.value,
                    ),
                  ),

                  SizedBox(
                    height: Get.size.height * 0.02,
                  ),

                  Container(
                    child: textView(
                      context: context,
                      labelText: "Feedback",
                      hintText: "Enter Feedback",
                      controller: _controller.feedbackController.value,
                      focusNode: _controller.feedbackFocus.value,
                    ),
                  ),

                  SizedBox(
                    height: Get.size.height * 0.02,
                  ),

                  loader
                  ? buttonView(
                      title: "Submit",
                      width: Get.size.width,
                      onPressed: () async {
                        setState(() {
                          loader = false;
                        });
                        final feedback = {
                          SheetsColumns.country : _controller.countryController.value.text.trim(),
                          SheetsColumns.feedback : _controller.feedbackController.value.text.trim(),
                          SheetsColumns.name : _controller.nameController.value.text.trim(),
                        };

                        await FlutterSheet.insert([feedback]);

                        setState(() {
                          loader = true;
                        });

                        _controller.countryController.value.clear();
                        _controller.nameController.value.clear();
                        _controller.feedbackController.value.clear();

                        _controller.nameFocus.value.unfocus();
                        _controller.countryFocus.value.unfocus();
                        _controller.feedbackFocus.value.unfocus();

                      }
                    )
                    : CircularProgressIndicator(color: AppColors.appGreenColor,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
