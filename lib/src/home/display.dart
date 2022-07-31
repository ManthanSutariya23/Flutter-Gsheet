import 'package:connect_google_excel/src/config/colors.dart';
import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      body: Center(child: Text('Display')),
    );
  }
}

