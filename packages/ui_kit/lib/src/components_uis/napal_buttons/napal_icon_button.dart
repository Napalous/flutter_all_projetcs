import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class NapalIconButton extends StatelessWidget {
  final Widget icon;
  final Color? color, borderColor;
  final double? radius, padding;
  final void Function()? onClick;
  final bool isCircle;
  const NapalIconButton({
    super.key,
    this.color,
    this.radius,
    this.onClick,
    required this.icon,
    this.isCircle = true,
    this.borderColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(padding??10),
        decoration: BoxDecoration(
          color: color ?? NapalColors.primary,
          borderRadius: !isCircle ? BorderRadius.circular(radius ?? 8) : null,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          border: borderColor!=null ? Border.all(color: borderColor!, width: 1.5): null,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
