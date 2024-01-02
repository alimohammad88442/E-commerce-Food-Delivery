import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/prducts_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cartController;
  bool _isloading = false;
  bool get isloaging => _isloading;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get inCArtItem => _inCartItem + _quantity;
  Future<void> getpopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isloading = true;
      update();
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkquantity(_quantity + 1);
      print(_quantity);
    } else {
      _quantity = checkquantity(_quantity - 1);
      print(_quantity);
    }

    update();
  }

  int checkquantity(int quantity) {
    if ((_inCartItem + quantity) > 20) {
      Get.snackbar(
        'Item count',
        'the limit is 20',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else if ((_inCartItem + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "you cont't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cartController, ProductModel productModel) {
    _quantity = 0;
    _inCartItem = 0;
    _cartController = cartController;
    var exist = false;
    exist = _cartController.existInCart(productModel);
    print('exist is $exist');
    if (exist) {
      _inCartItem = cartController.getQuantity(productModel);
    }
  }

  void addItem(ProductModel productModel) {
    _cartController.addItem(productModel, _quantity);
    _quantity = 0;
    _inCartItem = _cartController.getQuantity(productModel);
    _cartController.item.forEach((key, value) {
      print('the id is ${value.id} and the quantity is ${value.quantity}');
    });
    update();
  }

//this get method will have  all the added product
  int get totalItems {
    return _cartController.totalItems;
  }

  List<CartModel> get getItems {
    return _cartController.getItems;
  }
}