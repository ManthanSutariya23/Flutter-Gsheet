import 'package:connect_google_excel/src/config/colors.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(child: Text('Update')),
    );
  }
}

