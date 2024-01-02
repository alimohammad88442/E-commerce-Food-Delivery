import 'package:flutter/material.dart';
import 'package:food_delivery/models/prducts_model.dart';
import 'package:food_delivery/utils/constans.dart';
import 'package:food_delivery/utils/dimensions.dart';

class PopularFoodDetailsImg extends StatelessWidget {
  const PopularFoodDetailsImg({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.pupularFoodImgSize,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(Appconstants.baseUrl +
              Appconstants.uploadUrl +
              productModel.img!),
        ),
      ),
    );
  }
}