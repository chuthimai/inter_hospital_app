import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final Alignment alignment;
  final double fontSize;
  final TextStyle? textStyle;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 4),
    this.alignment = Alignment.centerLeft,
    this.textStyle,
    this.fontSize=13,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.white24,
      child: Container(
        alignment: alignment,
        padding: padding,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.button?.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w600
            )
          ),
        ),
      ),
    );
  }
}
