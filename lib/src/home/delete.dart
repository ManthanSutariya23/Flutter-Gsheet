import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connect_google_excel/src/API/api_variable.dart';
import 'package:connect_google_excel/src/config/colors.dart';
import 'package:connect_google_excel/src/constant/credential.dart';
import 'package:connect_google_excel/src/widget/comman_widget/appbar.dart';
import 'package:connect_google_excel/src/widget/comman_widget/record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Delete extends StatefulWidget {
  const Delete({Key? key}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  bool loader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(
          context: context, 
          title: "Delete Data",
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
        child: 
        APIvariable.allData.length == 0
        ? record()
        : ListView.builder(
          itemCount: APIvariable.allData.length,
          itemBuilder: (BuildContext context, int index) {
            if(index != 0) {
              return InkWell(
                onTap: () async {
                  
                  cancleDialog(context, () async {
                    await FlutterSheet.delete(index+1);
                    setState(() {
                      loader = true;
                    });

                    await FlutterSheet.display();

                    setState(() {
                      loader = false;
                    });
                  });
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

  AwesomeDialog cancleDialog(BuildContext context,Function() ontap) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    borderSide: BorderSide(color: AppColors.appGreenColor, width: 1),
    width: 350,
    btnOkColor: AppColors.appGreenColor,
    btnCancelColor: AppColors.appGreenColor,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.SCALE,
    title: 'Are You Sure ',
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: ontap,
  )..show();
}

}
