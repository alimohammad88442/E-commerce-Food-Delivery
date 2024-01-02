import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/pages/food/popular_food_details/popular_food_details_widgers/popular_food_details_app_bar.dart';
import 'package:food_delivery/pages/food/popular_food_details/popular_food_details_widgers/popular_food_details_body.dart';
import 'package:food_delivery/pages/food/popular_food_details/popular_food_details_widgers/popular_food_details_bottom_navigation_bar.dart';
import 'package:food_delivery/pages/food/popular_food_details/popular_food_details_widgers/popular_food_details_img.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail(
      {super.key, required this.pageId, required this.page});
  final int pageId;
  final String page;
  @override
  Widget build(BuildContext context) {
    //instent
    var productModel =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), productModel);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: PopularFoodDetailsImg(productModel: productModel),
          ),
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height45,
            child: ProductFoodDetailsAppBar(page: page),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.pupularFoodImgSize - 20,
              bottom: 0,
              child: PopularFoodDetailsBody(
                productModel: productModel,
              ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return PopularFoodDetailsBottomNavigationBar(
              productModel: productModel , popularProduct: popularProduct);
        },
      ),
    );
  }
}


