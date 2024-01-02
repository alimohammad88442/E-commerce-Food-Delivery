import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/constans.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class CartItemListViewBody extends StatelessWidget {
  const CartItemListViewBody(
      {super.key,
      required this.cartController,
      required this.index,
      required this.cartList});
  final CartController cartController;
  final List<CartModel> cartList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: Dimensions.height20 * 5,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              var popularIndex = Get.find<PopularProductController>()
                  .popularProductList
                  .indexOf(cartList[index].productModel!);
              if (popularIndex >= 0) {
                Get.toNamed(RoutsHelper.getPopularFoodDetails(
                    popularIndex, 'cartPage'));
              } else {
                var recommendedIndex = Get.find<RecommendedProductController>()
                    .recommendedProductList
                    .indexOf(cartList[index].productModel!);
                if (recommendedIndex < 0) {
                  Get.snackbar(
                    "History Product",
                    "product review is not availble for history product",
                    backgroundColor: AppColors.mainColor,
                    colorText: Colors.white,
                  );
                } else {
                  Get.toNamed(RoutsHelper.getRecommendedFoodDetails(
                      recommendedIndex, 'cartPage'));
                }
              }
            },
            child: Container(
              height: Dimensions.height20 * 5,
              width: Dimensions.height20 * 5,
              margin: EdgeInsets.only(bottom: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(Appconstants.baseUrl +
                      Appconstants.uploadUrl +
                      cartController.getItems[index].img!),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: SizedBox(
              height: Dimensions.height20 * 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BigText(text: cartController.getItems[index].name!),
                  const SmallText(text: 'spicy'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: '\$ ${cartController.getItems[index].price}',
                        color: Colors.redAccent,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20,
                            vertical: Dimensions.height10),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  cartController.addItem(
                                      cartList[index].productModel!, -1);
                                },
                                child: const Icon(Icons.remove)),
                            const SizedBox(width: 5),
                            BigText(text: ' ${cartList[index].quantity}'),
                            const SizedBox(width: 5),
                            GestureDetector(
                                onTap: () {
                                  cartController.addItem(
                                      cartList[index].productModel!, 1);
                                },
                                child: const Icon(Icons.add)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
