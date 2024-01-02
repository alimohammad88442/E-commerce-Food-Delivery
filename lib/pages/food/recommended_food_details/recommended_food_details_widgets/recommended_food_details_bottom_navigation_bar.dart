import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/models/prducts_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class RecommendedFoodDetailsBottomNavigationBar extends StatelessWidget {
  const RecommendedFoodDetailsBottomNavigationBar(
      {super.key, required this.controller, required this.productModel});
  final PopularProductController controller;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: Dimensions.width20 * 2.5,
            right: Dimensions.width20 * 2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.setQuantity(false);
                },
                child: AppIcon(
                  iconsize: Dimensions.iconSzie24,
                  icon: Icons.remove,
                  backGroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ),
              BigText(
                  text: '\$ ${productModel.price} X ${controller.inCArtItem}'),
              GestureDetector(
                onTap: () {
                  controller.setQuantity(true);
                },
                child: AppIcon(
                  iconsize: Dimensions.iconSzie24,
                  icon: Icons.add,
                  backGroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              )
            ],
          ),
        ),
        Container(
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
                    horizontal: Dimensions.height20,
                    vertical: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.favorite,
                  color: AppColors.mainColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.addItem(productModel);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(
                    text: '\$ ${productModel.price} | add to cart',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
