import 'package:connect_google_excel/src/config/colors.dart';
import 'package:connect_google_excel/src/constant/credential.dart';
import 'package:connect_google_excel/src/constant/sheetscolumn.dart';
import 'package:connect_google_excel/src/controller/insert_controller.dart';
import 'package:connect_google_excel/src/widget/comman_widget/appbar.dart';
import 'package:connect_google_excel/src/widget/comman_widget/button_view.dart';
import 'package:connect_google_excel/src/widget/comman_widget/textview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

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

                        if(_controller.countryController.value.text.isNotEmpty && _controller.nameController.value.text.isNotEmpty && _controller.feedbackController.value.text.isNotEmpty) {
                          print("enter");
                          await FlutterSheet.insert([feedback]);
                        }
                        else {
                          if(_controller.countryController.value.text.isEmpty)
                          {
                            errorDialog(title: 'Country');
                          }
                          else if(_controller.nameController.value.text.isEmpty)
                          {
                            errorDialog(title: 'Name');
                          }
                          else if(_controller.feedbackController.value.text.isEmpty)
                          {
                            errorDialog(title: 'Feedback');
                          }
                        }

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

  errorDialog({required String title}) {
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('Please Enter $title'),
      animationCurve: Curves.bounceOut,
      borderRadius: 10,
      animationDuration: const Duration(milliseconds: 1000),
    ).show(context);
  }
}
