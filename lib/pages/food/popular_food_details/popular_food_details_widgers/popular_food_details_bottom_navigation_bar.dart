import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/models/prducts_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';

class PopularFoodDetailsBottomNavigationBar extends StatelessWidget {
  const PopularFoodDetailsBottomNavigationBar(
      {super.key, required this.productModel, required this.popularProduct});
  final ProductModel productModel;
  final PopularProductController popularProduct;

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
                GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: const Icon(Icons.remove)),
                const SizedBox(width: 5),
                BigText(text: popularProduct.inCArtItem.toString()),
                const SizedBox(width: 5),
                GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(true);
                    },
                    child: const Icon(Icons.add)),
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
                popularProduct.addItem(productModel);
              },
              child: BigText(
                text: '\$ ${productModel.price} | add to cart',
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}