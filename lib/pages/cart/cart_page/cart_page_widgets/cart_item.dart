import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/pages/cart/cart_page/cart_page_widgets/cart_page_list_view_body.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                      margin: EdgeInsets.only(top: Dimensions.height10),
                      //color: Colors.red,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                          builder: (controller) {
                            var cartList = controller.getItems;
                            return ListView.builder(
                              itemCount: cartList.length,
                              itemBuilder: (context, index) {
                                return CartItemListViewBody(
                                  cartList: cartList,
                                  cartController: controller,
                                  index: index,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
  }
}