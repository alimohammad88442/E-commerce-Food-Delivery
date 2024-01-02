import 'package:flutter/material.dart';
import 'package:food_delivery/base/no_data_page.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/pages/cart/cart_page/cart_page_widgets/cart_app_bar.dart';
import 'package:food_delivery/pages/cart/cart_page/cart_page_widgets/cart_item.dart';
import 'package:food_delivery/pages/cart/cart_page/cart_page_widgets/cart_page_b_n_b_details.dart';
import 'package:food_delivery/utils/dimensions.dart';


import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: const CartAppBAr()
          ),
          GetBuilder<CartController>(builder: (controller) {
            return controller.getItems.isNotEmpty
                ? Positioned(
                    top: Dimensions.height20 * 5,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: const CartItem()
                  )
                : const NoDataPage(
                    text: 'Your cart is empty!',
                    imgPath: 'assets/images/food.png',
                  );
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return cartController.getItems.isNotEmpty
              ? CartBottomNavigationBartDetails(cartController: cartController)
              : Container();
        },
      ),
    );
  }
}


