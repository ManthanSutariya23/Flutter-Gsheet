

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InsertController extends GetxController {

  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> feedbackController = TextEditingController().obs;

  Rx<FocusNode> countryFocus = FocusNode().obs;
  Rx<FocusNode> nameFocus = FocusNode().obs;
  Rx<FocusNode> feedbackFocus = FocusNode().obs;
}
