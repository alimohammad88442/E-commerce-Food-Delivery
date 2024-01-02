import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/pages/cart/cart_history/cart_history_widgets/cart_history_app_bar.dart';
import 'package:food_delivery/pages/cart/cart_history/cart_history_widgets/cart_history_list_view_details.dart';
import 'package:food_delivery/pages/cart/cart_history/cart_history_widgets/cart_history_list_view_imgs.dart';

import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';

import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistory = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemPerorder = Map();
    for (var i = 0; i < getCartHistory.length; i++) {
      if (cartItemPerorder.containsKey(getCartHistory[i].time)) {
        cartItemPerorder.update(
            getCartHistory[i].time!, (value) => value += value);
      } else {
        cartItemPerorder.putIfAbsent(getCartHistory[i].time!, () => 1);
      }
    }

    List<int> cartItemPerOrderTOList() {
      return cartItemPerorder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemPerorder.entries.map((e) => e.key).toList();
    }

    List<String> orderTime = cartOrderTimeToList();
    List<int> itemPerOrder = cartItemPerOrderTOList();

    int listCounter = 0;
    return Scaffold(
      body: Column(
        children: [
          const CartHistoryAppBar(),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(Dimensions.height20),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  for (int i = 0; i < itemPerOrder.length; i++)
                    Container(
                      height: Dimensions.height20 * 11,
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                        children: [
                          BigText(text: getCartHistory[listCounter].time!),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(
                                  itemPerOrder[i],
                                  (index) {
                                    if (listCounter < getCartHistory.length) {
                                      listCounter++;
                                    }
                                    return index <= 2
                                        ? CartHistoryListViewImgs(
                                            getCartHistory: getCartHistory,
                                            listCounter: listCounter)
                                        : Container();
                                  },
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height20 * 4,
                                child: CartHistoryListViewDetails(
                                    itemPerOrder: itemPerOrder,
                                    i: i,
                                    getCartHistory: getCartHistory,
                                    orderTime: orderTime),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
