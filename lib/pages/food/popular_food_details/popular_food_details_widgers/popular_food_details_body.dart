import 'package:flutter/material.dart';
import 'package:food_delivery/models/prducts_model.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text.dart';

class PopularFoodDetailsBody extends StatelessWidget {
  const PopularFoodDetailsBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: productModel.name!),
                  SizedBox(height: Dimensions.height20),
                  const BigText(text: 'ali asdfsdaf'),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: productModel.description!),
                    ),
                  ),
                ],
              ),
            );
  }
}