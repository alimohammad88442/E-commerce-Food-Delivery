import 'package:flutter/material.dart';
import 'package:food_delivery/models/prducts_model.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';

class RecommendedFoodDetailsBottomName extends StatelessWidget {
  const RecommendedFoodDetailsBottomName({super.key, required this.productModel});
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  width: double.maxFinite,
                  child: Center(
                    child: BigText(
                      text: productModel.name!,
                    ),
                  ),
                );
  }
}