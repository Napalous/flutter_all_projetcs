import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class NapalOutlineButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? radius, pH, pV, textSize;
  final void Function()? onClick;
  final Widget? icon;
  const NapalOutlineButton({
    super.key,
    required this.text,
    this.color,
    this.radius,
    this.onClick,
    this.icon,
    this.pH, this.pV,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: pH??20, vertical: pV??12),
        decoration: BoxDecoration(
          border: Border.all(
            color: color ?? NapalColors.primary,
          ),
          borderRadius: BorderRadius.circular(radius ?? 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon! : Container(),
            YasText.bold(
              text: text,
              textColor: color ?? NapalColors.primary,
              textSize: textSize??16,
            ),
          ],
        ),
      ),
    );
  }
}
