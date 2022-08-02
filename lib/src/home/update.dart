import 'package:connect_google_excel/src/API/api_variable.dart';
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

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  
  bool loader = false;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(
          context: context, 
          title: "Update Data",
          isAction: true,
          changeIcon: true,
          action: [
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.refresh,color: AppColors.whiteColor,),
                ),
                onTap: () async {
                  setState(() {
                    loader = true;
                  });

                  await FlutterSheet.display();

                  setState(() {
                    loader = false;
                  });
                }
              ),
              SizedBox(width: 20),
            ]
          ),
      backgroundColor: AppColors.whiteColor,
      body: loader
        ? Center(
          child: CircularProgressIndicator(color: AppColors.appGreenColor,)
        )
        : Container(
        width: Get.size.width,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: APIvariable.allData.length,
          itemBuilder: (BuildContext context, int index) {
            if(index != 0) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateInfo(
                      country: APIvariable.allData[index][1],
                      feedback: APIvariable.allData[index][2],
                      name: APIvariable.allData[index][0],
                      i: index+1,
                    ),));
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.size.height * 0.02,
                    ),

                    Container(
                      width: Get.size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.appGreenColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: Get.size.height * 0.01,),

                          Text('Name : ${APIvariable.allData[index][0]}',
                            style: TextStyle(
                              color: AppColors.whiteColor
                            ),
                          ),

                          SizedBox(height: Get.size.height * 0.01,),
                          
                          Text('Country : ${APIvariable.allData[index][1]}',
                            style: TextStyle(
                              color: AppColors.whiteColor
                            ),
                          ),

                          SizedBox(height: Get.size.height * 0.01,),

                          Text('Feedback : ${APIvariable.allData[index][2]}',
                            style: TextStyle(
                              color: AppColors.whiteColor
                            ),
                          ),

                          SizedBox(height: Get.size.height * 0.01,),
                        ],
                      ),
                    )
                  
                  ],
                ),
              );
            
            }
            else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}


class UpdateInfo extends StatefulWidget {
  UpdateInfo({Key? key,required this.name,required this.country,required this.feedback,required this.i}) : super(key: key);

  String name;
  String country;
  String feedback;
  int i;

  @override
  State<UpdateInfo> createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {

  var frmkey1 = GlobalKey<FormState>();
  final InsertController _controller = Get.put(InsertController());
  bool loader = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.nameController.value.text = widget.name;
    _controller.feedbackController.value.text = widget.feedback;
    _controller.countryController.value.text = widget.country;
  }
  
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
        appBar: appBar(context: context, title: "Update Data"),
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
                      title: "Update",
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
                          await FlutterSheet.update(widget.i, feedback);
                          await FlutterSheet.display();
                          Navigator.of(context).pop();
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

