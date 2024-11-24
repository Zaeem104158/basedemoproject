import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final bool softWrap;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextStyle? style; // Directly accept a TextStyle

  const CustomeText({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.textDirection = TextDirection.ltr,
    this.decoration,
    this.textAlign = TextAlign.left,
    this.softWrap = true,
    this.fontStyle,
    this.maxLines,
    this.style, // Accepts custom text style
  });

  @override
  Widget build(BuildContext context) {
    // If style is provided, use it; otherwise, use the theme style
    final TextStyle? themeStyle = style ??
        Theme.of(context)
            .textTheme
            .bodyMedium; // Default to bodyMedium if not provided

    return Text(
      text,
      style: themeStyle?.copyWith(
        fontWeight: fontWeight ?? themeStyle.fontWeight,
        fontSize: fontSize ?? themeStyle.fontSize,
        color: color ?? themeStyle.color,
        fontStyle: fontStyle ?? themeStyle.fontStyle,
        decoration: decoration ?? themeStyle.decoration,
      ),
      textDirection: textDirection,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
