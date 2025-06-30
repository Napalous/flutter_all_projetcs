import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';

class NapalPhonenumberField extends StatefulWidget {
  final String? label, indicatif, hint, fontFamily;
  final String flag;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  const NapalPhonenumberField({
    super.key,
    this.controller,
    this.validator,
    this.label,
    this.hint,
    this.indicatif,
    required this.flag,
    this.fontFamily,
    this.focusNode,
  });

  @override
  State<NapalPhonenumberField> createState() => _NapalPhonenumberFieldState();
}

class _NapalPhonenumberFieldState extends State<NapalPhonenumberField> {
  @override
  Widget build(BuildContext context) {
    return YasTextField(
      controller: widget.controller,
      label: widget.label,
      hint: widget.hint,
      focusNode: widget.focusNode,
      prefixIcon: SizedBox(
        width: 100,
        child: Row(
          spacing: 5,
          children: [
            SizedBox(width: 10),
            Row(
              spacing: 5,
              children: [
                Image.asset(widget.flag, width: 30, height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    YasText.extraMedium(
                      text: widget.indicatif ?? "+221",
                      textColor: NapalColors.textPrimary,
                      fontFamil: widget.fontFamily,
                    ),
                    SizedBox(height: 2)
                  ],
                ),
              ],
            ),
            Container(
              width: 1,
              height: 27,
              decoration: BoxDecoration(
                color: NapalColors.darkGrey,
              ),
            )
          ],
        ),
      ),
      keyboardType: TextInputType.number,
      validator: widget.validator,
      inputFormatters: [
        YasSnPhoneFormater(sample: 'XX XXX XX XX', separator: ' '),
        FilteringTextInputFormatter.singleLineFormatter,
      ],
    );
  }
}
