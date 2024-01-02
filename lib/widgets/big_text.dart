import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    this.color,
    required this.text,
     this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  });
  final Color? color;
  final String text;
  final double? size;
  final TextOverflow overflow;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      overflow: overflow,
  maxLines: 1,
      style: TextStyle(fontSize: size , color: color , fontWeight: FontWeight.w400),
    );
  }
}
