import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui_kit/ui_kit.dart';

class NapalOtpField extends StatelessWidget {
  final double? width;
  final void Function(String) onCompleted;
  final void Function(String)? onChange;
  final int length;
  final String? Function(String?)? validator;
  const NapalOtpField({
    super.key,
    this.width,
    required this.onCompleted,
    this.onChange,
    required this.length,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: PinCodeTextField(
        appContext: context,
        length: length,
        autoFocus: true,
        cursorColor: NapalColors.textPrimary,
        validator: validator ?? NapalValidator.requiredValidation,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 60,
          fieldWidth: 55,
          activeFillColor: NapalColors.white,
          inactiveFillColor: NapalColors.white,
          selectedFillColor: NapalColors.white,
          activeColor: NapalColors.darkGrey,
          selectedColor: NapalColors.darkGrey,
          inactiveColor: NapalColors.lightGrey,
          errorBorderColor: NapalColors.darkRed,
          errorBorderWidth: 1,
          borderWidth: 1,
          inactiveBorderWidth: 0.8,
          activeBorderWidth: 1,
        ),
        onCompleted: onCompleted,
        onChanged: onChange,
        textStyle: NapalThemes.otpFieldStyle,
        keyboardType: TextInputType.number,
        cursorHeight: 25,
      ),
    );
  }
}
