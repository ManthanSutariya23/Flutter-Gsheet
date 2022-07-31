import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class TextFieldValidation {
  TextFieldValidation._();

  static String? validation({
    @required BuildContext? context,
    String? value,
    String? message,
    bool isEmailValidator = false,
    bool isPasswordValidator = false,
    bool isFullNameValidator = false,
    bool isMobileValidator = false,

  }) {
    if (value!.isEmpty ||  (!RegExp(r"^[a-zA-Z0-9]").hasMatch(value))) {
      return "$message is required!";
    } else if (isEmailValidator == true) {
      if (value.isEmpty) {
        // return "$message is required!";
      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
        return 'Enter Valid $message';
      }
    } else if (isPasswordValidator == true) {
      if (value.isEmpty) {
        return "$message is required!";
      } else if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$").hasMatch(value)) {
        if (value.length < 6) {
          return 'Password must have at least 6 characters';
        } else if (!value.contains(RegExp(r'[A-Za-z]'))) {
          return 'Password must have at least one alphabet characters';
        } else if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Password must have at least one number characters';
        }
      }
    } else if (isFullNameValidator == true) {
      if (value.isEmpty) {
        return "$message is required!";
      } else if (!RegExp(r"^[a-zA-Z]+ [a-zA-Z]+$").hasMatch(value)) {
        if (!value.contains(RegExp(r'^[A-Z]'))) {
          return 'First alphabet must be capital';
        }
      }
    } else if (isMobileValidator == true) {
      if (value.isEmpty) {
        return "$message is required!";
      } else if (value.length < 10) {
        return "Enter Valid $message!";
      }
    }
    return null;
  }
}

errordialog(context,name,dis) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    animType: AnimType.RIGHSLIDE,
    headerAnimationLoop: true,
    title: name,
    desc: dis,
    btnOkOnPress: () {},
    btnOkIcon: Icons.cancel,
    btnOkColor: Colors.red
  )..show();
}

