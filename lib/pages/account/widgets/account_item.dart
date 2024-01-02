import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({super.key, required this.appIcon, required this.bigText});
  final AppIcon appIcon;
  final BigText bigText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 1
        )
      ]),
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        top: Dimensions.width20 - 5,
        bottom: Dimensions.width20 - 5,
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimensions.width20,
          ),
          bigText,
        ],
      ),
    );
  }
}
