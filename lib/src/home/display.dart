import 'package:connect_google_excel/src/API/api_variable.dart';
import 'package:connect_google_excel/src/config/colors.dart';
import 'package:connect_google_excel/src/constant/credential.dart';
import 'package:connect_google_excel/src/widget/comman_widget/appbar.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();

  }

  bool loader = true;

  fetchData() async {
    await FlutterSheet.display();
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'All record'),
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
              return Column(
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

