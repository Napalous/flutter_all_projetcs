import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';

class NapalTextField extends StatefulWidget {
  final String? label, prefixText, hint;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final bool readOnly;
  final void Function()? onTap;
  final Color? fillColor;
  final bool fill;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool withBorder;
  final bool obscureText;
  const NapalTextField({
    super.key,
    this.label,
    this.prefixText,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.fill = true,
    this.fillColor,
    this.maxLines,
    this.suffixIcon,
    this.focusNode,
    this.withBorder = false,
    this.hint,
    this.obscureText = false,
  });

  @override
  State<NapalTextField> createState() => _NapalTextFieldState();
}

class _NapalTextFieldState extends State<NapalTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      validator: widget.validator ?? YasValidator.requiredValidation,
      cursorColor: NapalColors.textPrimary,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      style: NapalThemes.fieldStyle,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        prefixText: widget.prefixText,
        suffixIcon: widget.suffixIcon,
        labelText: widget.label,
        hintText: widget.hint,
        hintStyle: NapalThemes.fieldLabelStyle,
        filled: widget.fill,
        fillColor: widget.fillColor ?? NapalColors.white,
        labelStyle: NapalThemes.fieldLabelStyle,
        border: NapalThemes.fieldBorder,
        enabledBorder: NapalThemes.fieldBorder,
        focusedBorder: NapalThemes.fieldSelectedBorder,
      ),
    );
  }
}
