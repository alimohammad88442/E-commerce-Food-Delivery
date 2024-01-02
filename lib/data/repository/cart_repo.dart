import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});
  List<String> cart = [];
  List<String> cartHistory = [];
  //______________________________
  void addToCartList({required List<CartModel> cartList}) {
    String time = DateTime.now().toString();
    cart = [];
    //convert object to string because sharadpreferences take only string
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(Appconstants.cartList, cart);
  }

  //____________________
  List<CartModel> getcartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(Appconstants.cartList)) {
      carts = sharedPreferences.getStringList(Appconstants.cartList)!;
    }
    List<CartModel> cartList = [];
    carts.forEach((element) {
      return cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }

  List<CartModel> getCartListHistory() {
    if (sharedPreferences.containsKey(Appconstants.cartHistoyList)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(Appconstants.cartHistoyList)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) {
      return cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartListHistory;
  }

  void addTocartHistoryList() {
    if (sharedPreferences.containsKey(Appconstants.cartHistoyList)) {
      cartHistory =
          sharedPreferences.getStringList(Appconstants.cartHistoyList)!;
    }
    for (var i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(Appconstants.cartHistoyList, cartHistory);
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(Appconstants.cartList);
  }

  void clearCartHistory() {
    removeCart();
    cartHistory = [];
    sharedPreferences.remove(Appconstants.cartHistoyList);
  }
}


  /*
  }*/

