import 'package:connect_google_excel/src/config/colors.dart';
import 'package:flutter/material.dart';

class Delete extends StatefulWidget {
  const Delete({Key? key}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(child: Text('Delete')),
    );
  }
}
