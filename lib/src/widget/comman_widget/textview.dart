import 'package:connect_google_excel/src/config/colors.dart';
import 'package:connect_google_excel/src/config/text_style.dart';
import 'package:connect_google_excel/src/utils/validation/validation.dart';
import 'package:flutter/material.dart';

Widget textView({
  @required BuildContext? context,
  @required String? labelText,
  @required String? hintText,
  @required TextEditingController? controller,
  Icon? suffix,
  bool suffixIconAvailable = false,
  bool obscureText = false,
  int maxLine = 1,
  bool needValidation = false,
  bool isEmailValidator = false,
  bool isPasswordValidator = false,
  bool isFullNameValidator = false,
  bool isMobileValidator = false,
  String? validationMessage,
  TextInputType? textInputType,
  bool isReadOnly = false,
  int maxLength = 1000,
  double? hintTextSize,
  double? leftPadding,
  double? rightPadding,
  double? topPadding,
  double? bottomPadding,
  FocusNode? focusNode,
  Function()? onPressed,
  Function()? suffixIconPressed,
  Function(String)? onChange,
}) {
  return Container(
    padding: EdgeInsets.only(
        left: leftPadding ?? 0,
        right: rightPadding ?? 0,
        top: topPadding ?? 0,
        bottom: bottomPadding ?? 0),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLine,
      maxLength: maxLength,
      onChanged: onChange,
      focusNode: focusNode,
      validator: needValidation
          ? (value) => TextFieldValidation.validation(
                context: context,
                value: value ?? "",
                isPasswordValidator: isPasswordValidator,
                message: validationMessage ?? hintText,
                isEmailValidator: isEmailValidator,
                isFullNameValidator: isFullNameValidator,
                isMobileValidator: isMobileValidator,
              )
          : null,
      keyboardType: textInputType ?? TextInputType.text,
      readOnly: isReadOnly,
      onTap: onPressed,
      style: AppTextStyle.regular16.copyWith(
          fontSize: 16,
          color: AppColors.darkBlackColor.withOpacity(0.7),
          fontWeight: FontWeight.normal),
      cursorColor: AppColors.appGreenColor.withOpacity(0.7),
      decoration: InputDecoration(
        alignLabelWithHint: true,
          labelText: labelText,
          labelStyle: AppTextStyle.regular16
              .copyWith(fontSize: 13, color: AppColors.primaryGreyColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primaryGreyColor.withOpacity(0.7),
              width: 1,
            ),
          ),
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primaryGreyColor.withOpacity(0.5),
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primaryGreyColor.withOpacity(0.5),
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryRedColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.appGreenColor.withOpacity(0.7),
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.all(12),
          suffixIcon: suffixIconAvailable
              ? IconButton(
                  onPressed: suffixIconPressed,
                  icon: suffix!,
                  color: AppColors.primaryGreyColor,
                )
              : const Padding(padding: EdgeInsets.all(8)),
          hintText: hintText,
          hintStyle: AppTextStyle.regular16
              .copyWith(fontSize: hintTextSize, color: AppColors.primaryGreyColor)),
    ),
  );
}
