import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/src/themes/index.dart';

class NapalPasswordField extends StatefulWidget {
  final String? label, obscuringCharacter;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool readOnly;
  final void Function()? onTap;
  final Color? fillColor;
  final bool fill;
  final int? maxLines;
  final bool isPasswordField;

  const NapalPasswordField({
    super.key,
    this.label,
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
    this.isPasswordField = true,
    this.obscuringCharacter,
  });

  @override
  State<NapalPasswordField> createState() => _NapalPasswordFieldState();
}

class _NapalPasswordFieldState extends State<NapalPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        validator: widget.validator ?? YasValidator.requiredValidation,
        cursorColor: NapalColors.textPrimary,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        maxLines: widget.isPasswordField ? 1 : widget.maxLines,
        obscureText: widget.isPasswordField ? _obscureText : false,
        style: NapalThemes.fieldStyle,
        obscuringCharacter: widget.obscuringCharacter ?? ".",
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  icon: Icon(
                    color: NapalColors.darkGrey,
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          labelText: widget.label,
          filled: widget.fill,
          fillColor: widget.fillColor ?? NapalColors.white,
          labelStyle: NapalThemes.fieldLabelStyle,
          border: NapalThemes.fieldBorder,
          enabledBorder: NapalThemes.fieldBorder,
          focusedBorder: NapalThemes.fieldSelectedBorder,
        ),
      ),
    );
  }
}
