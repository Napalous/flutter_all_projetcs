import 'package:flutter/material.dart';

class NapalText {
  static Text extraRegular({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w300,
    );
  }

  static Text regular({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w400,
    );
  }

  static Text medium({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w500,
    );
  }

  static Text extraMedium({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w600,
    );
  }

  static Text bold({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w700,
    );
  }

  static Text extraBold({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w800,
    );
  }

  static Text _buildText({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: textSize ?? 15.0,
        color: textColor,
        fontFamily: fontFamil,
        fontWeight: fontWeight,
      ),
    );
  }
}
