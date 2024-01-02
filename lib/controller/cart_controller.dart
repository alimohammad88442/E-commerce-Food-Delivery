import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/prducts_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

//the putIfAbsent  is a build function in inside the map
// the update id is a build function in inside the map
//the defirince between the update and the putIfAbsent is the a putIfAbsent add
// a now _item put the update is to add values to the already exist
//
//
//so we used the totalQuantity because after adding to cart a quantity and i want to remov it
// so i will add the value.quantity to the quantity inside the additem method
//so i used if condtion to remove the product from the cart if the totalquantity it is 0
class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModel> _item = {};
  Map<int, CartModel> get item => _item;
  List<CartModel> storageItem = [];
  //
  void addItem(ProductModel productModel, int quantity) {
    var totalQuantity = 0;
    if (_item.containsKey(productModel.id)) {
      _item.update(productModel.id!, (value) {
        //the (value) is a object form the productmodel
        // so i will rebplas the value i woant to update from the productmodel to (value)
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          isExist: true,
          //the first quantity is form the model and the second one is from the additem method
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
          productModel: productModel,
        );
      });

      if (totalQuantity <= 0) {
        _item.remove(productModel.id);
        Get.snackbar(
          'remove item',
          'you remove the ${productModel.name} from your cart',
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    } else {
      if (quantity > 0) {
        _item.putIfAbsent(productModel.id!, () {
          return CartModel(
            id: productModel.id,
            name: productModel.name,
            price: productModel.price,
            img: productModel.img,
            isExist: true,
            quantity: quantity,
            time: DateTime.now().toString(),
            productModel: productModel,
          );
        });
      } else {
        Get.snackbar(
          "Item count",
          "you should add at least one item",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    cartRepo.addToCartList(cartList: getItems);
    update();
  }

  bool existInCart(ProductModel productModel) {
    if (_item.containsKey(productModel.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel productModel) {
    var quantity = 0;
    if (_item.containsKey(productModel.id)) {
      _item.forEach((key, value) {
        if (key == productModel.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _item.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems => _item.entries.map((e) {
        return e.value;
      }).toList();
//totalAmount methood is count the total price of every thing in the cart
  int get totalAmount {
    int totalAmaount = 0;
    _item.forEach((key, value) {
      totalAmaount += value.quantity! * value.price!;
    });

    return totalAmaount;
  }

  List<CartModel> getCartData() {
    setcart = cartRepo.getcartList();
    return storageItem;
  }

  set setcart(List<CartModel> item) {
    storageItem = item;
    for (var i = 0; i < storageItem.length; i++) {
      _item.putIfAbsent(storageItem[i].productModel!.id!, () => storageItem[i]);
    }
  }

  void addToHistoy() {
    cartRepo.addTocartHistoryList();
    clear();
  }

  void clear() {
    _item = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartListHistory();
  }

  set setItems(Map<int, CartModel> setItems) {
    _item = {};
    _item = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(cartList: getItems);
    update();
  }

  void clearCartHistory() {
    cartRepo.clearCartHistory();
  
    update();
  }
}
