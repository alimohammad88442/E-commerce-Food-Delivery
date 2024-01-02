import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetailsTitle extends StatelessWidget {
  const RecommendedFoodDetailsTitle({super.key, required this.page});
  final String page;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              if (page == 'cartPage') {
                Get.toNamed(RoutsHelper.cartFood);
              } else {
                Get.toNamed(RoutsHelper.initial);
              }
            },
            child: const AppIcon(icon: Icons.clear)),
        GetBuilder<PopularProductController>(builder: (controller) {
          return GestureDetector(
            onTap: () {
              if (controller.totalItems >= 1) {
                Get.toNamed(RoutsHelper.getCartFood());
              }
            },
            child: Stack(
              children: [
                const AppIcon(icon: Icons.shopping_cart_checkout),
                Positioned(
                    top: 0,
                    right: 0,
                    child: controller.totalItems >= 1
                        ? const AppIcon(
                            iconColor: Colors.transparent,
                            icon: Icons.circle,
                            size: 20,
                            backGroundColor: AppColors.mainColor,
                          )
                        : Container()),
                Positioned(
                    top: 3,
                    right: 3,
                    child: controller.totalItems >= 1
                        ? BigText(
                            text: Get.find<PopularProductController>()
                                .totalItems
                                .toString(),
                            color: Colors.white,
                            size: 12,
                          )
                        : Container())
              ],
            ),
          );
        })
      ],
    );
  }
}