import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.icon,
    this.iconColor = const Color(0xFF756d54),
    this.size = 40,
    this.iconsize = 16,
    this.backGroundColor = const Color(0xFFfcf4e4),
  });
  final IconData icon;
  final Color iconColor;
  final double size;
  final Color backGroundColor;
  final double iconsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconsize,
      ),
    );
  }
}
