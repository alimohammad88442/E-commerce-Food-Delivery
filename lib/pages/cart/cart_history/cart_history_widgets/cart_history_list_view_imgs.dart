import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/constans.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CartHistoryListViewImgs extends StatelessWidget {
  const CartHistoryListViewImgs({
    super.key,
    required this.getCartHistory,
    required this.listCounter,
  });

  final List<CartModel> getCartHistory;
  final int listCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Dimensions.height20 * 4,
        width: Dimensions.width30 * 6,
        margin: EdgeInsets.only(
            right: Dimensions.width20 / 2),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(
                    Dimensions.radius20),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    Appconstants
                            .baseUrl +
                        Appconstants
                            .uploadUrl +
                        getCartHistory[
                                listCounter -
                                    1]
                            .img!))),
        //i put -1 because the first time it will increases 1 befor i can use it
      );
  }
}