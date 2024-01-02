import 'package:flutter/material.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:get/get.dart';

class CartAppBAr extends StatelessWidget {
  const CartAppBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backGroundColor: AppColors.mainColor,
                    size: Dimensions.iconSzie24,
                  ),
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutsHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home,
                    iconColor: Colors.white,
                    backGroundColor: AppColors.mainColor,
                    size: Dimensions.iconSzie24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backGroundColor: AppColors.mainColor,
                  size: Dimensions.iconSzie24,
                )
              ],
            );
  }
}