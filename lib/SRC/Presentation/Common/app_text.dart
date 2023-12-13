import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;

  final TextAlign? textAlign;
  final int? maxLine;
  const AppText(
    this.text, {
    super.key,
    required this.style,
    this.maxLine,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      style: style,
    );
  }
}
