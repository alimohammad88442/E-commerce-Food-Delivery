import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    this.color,
    required this.text,
    this.size = 12,
    this.height = 1.2,
  });
  final Color? color;
  final String text;
  final double? size;
  final double height ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
        height: height
      ),
    );
  }
}
