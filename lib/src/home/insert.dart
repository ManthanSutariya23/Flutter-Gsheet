import 'package:connect_google_excel/src/config/colors.dart';
import 'package:flutter/material.dart';

class Insert extends StatefulWidget {
  const Insert({Key? key}) : super(key: key);

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      body: Center(child: Text('Insert')),
    );
  }
}

