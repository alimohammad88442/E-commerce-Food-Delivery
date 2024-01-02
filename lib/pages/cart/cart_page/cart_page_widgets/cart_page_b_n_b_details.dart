import 'package:flutter/material.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class CartBottomNavigationBartDetails extends StatelessWidget {
  const CartBottomNavigationBartDetails({
    super.key,
    required this.cartController,
  });
  final CartController cartController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.bottomheightvbar,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width20,
        vertical: Dimensions.height20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20 * 2),
          topRight: Radius.circular(Dimensions.radius20 * 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20, vertical: Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 5),
                BigText(text: cartController.totalAmount.toString()),
                const SizedBox(width: 5),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20, vertical: Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: AppColors.mainColor,
            ),
            child: GestureDetector(
              onTap: () {
                if (Get.find<Authcontroller>().userLoggedIn()) {
                  cartController.addToHistoy();
                } else {
                  Get.toNamed(RoutsHelper.getSignInPage());
                }
              },
              child: const BigText(
                text: ' check out',
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
