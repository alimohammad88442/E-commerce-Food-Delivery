import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class ApptextField extends StatelessWidget {
  const ApptextField(
      {super.key, required this.textController, required this.hintText, required this.icon,  this.isObscure = false});
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: const Offset(1, 10),
              color: Colors.grey.withOpacity(0.2))
        ],
      ),
      child: TextField(
        obscureText: isObscure ,
        controller: textController,
        decoration: InputDecoration(
          helperText: hintText,
          prefixIcon:  Icon(
            icon,
            color: AppColors.iconColor1,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
          ),
        ),
      ),
    );
  }
}
