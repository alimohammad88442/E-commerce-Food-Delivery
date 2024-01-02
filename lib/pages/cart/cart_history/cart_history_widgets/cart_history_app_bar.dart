import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class CartHistoryAppBar extends StatelessWidget {
  const CartHistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      width: double.maxFinite,
      height: Dimensions.height20 * 5,
      padding: EdgeInsets.only(top: Dimensions.height45),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BigText(
            text: ' your cart history',
            color: Colors.white,
          ),
          AppIcon(
            icon: Icons.shopping_cart_outlined,
            iconColor: AppColors.mainColor,
          )
        ],
      ),
    );
  }
}
