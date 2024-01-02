import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({super.key, required this.text, required this.icon, required this.iconColor});
  final String text;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon , color: iconColor, size: 15,),
      const  SizedBox(width: 3,),
      SmallText(text: text , ),

      ],
    );
  }
}
