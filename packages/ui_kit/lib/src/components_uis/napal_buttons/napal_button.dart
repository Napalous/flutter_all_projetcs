import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class NapalButton extends StatelessWidget {
  final String text;
  final Color? color, textColor;
  final double? radius;
  final void Function()? onClick;
  final Widget? icon;
  final double? pH, pV, textSize;
  final String? fontFamily;
  const NapalButton({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.radius,
    this.onClick,
    this.icon,
    this.textSize,
    this.pH,
    this.pV,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: pH?? 20, vertical: pV?? 12),
        decoration: BoxDecoration(
          color: color ?? NapalColors.primary,
          borderRadius: BorderRadius.circular(radius ?? 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon! : Container(),
            NapalText.bold(
              text: text,
              textColor: textColor ?? NapalColors.white,
              textSize: textSize?? 16,
              fontFamil: fontFamily
            ),
          ],
        ),
      ),
    );
  }
}
