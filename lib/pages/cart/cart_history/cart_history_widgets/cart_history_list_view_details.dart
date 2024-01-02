import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class CartHistoryListViewDetails extends StatelessWidget {
  const CartHistoryListViewDetails({
    super.key,
    required this.itemPerOrder,
    required this.i,
    required this.getCartHistory,
    required this.orderTime,
  });

  final List<int> itemPerOrder;
  final int i;
  final List<CartModel> getCartHistory;
  final List<String> orderTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
      children: [
        const SmallText(text: 'total'),
        BigText(text: '${itemPerOrder[i]}items'),
        GestureDetector(
          onTap: () {
            Map<int, CartModel> moreOrder = {};
            for (var m = 0;
                m < getCartHistory.length;
                m++) {
              if (getCartHistory[m].time ==
                  orderTime[i]) {
                moreOrder.putIfAbsent(
                    getCartHistory[m].id!,
                    () => CartModel.fromJson(
                        jsonDecode(jsonEncode(
                            getCartHistory[m]))));
              }
            }
            Get.find<CartController>().setItems =
                moreOrder;
            Get.find<CartController>()
                .addToCartList();
            Get.toNamed(
                RoutsHelper.getCartFood());
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                    Dimensions.width20 / 2,
                vertical:
                    Dimensions.height10 / 2),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(5),
                border: Border.all(
                    width: 1,
                    color: AppColors.mainColor)),
            child: const SmallText(
              text: 'one more',
              color: AppColors.mainColor,
            ),
          ),
        )
      ],
    );
  }
}