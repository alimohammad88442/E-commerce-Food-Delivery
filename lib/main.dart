import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';

import 'package:food_delivery/routes/routs_hleper.dart';

import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

//the dependencise are apiclient repo and controllers
//repo all it do is geting data or stor data
void main() async {
  //to make sure the data loaded successfuly
  WidgetsFlutterBinding.ensureInitialized();

  //to load the dependencies  befor runing the app
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    /* 
    because i am loading the popular and recommended product controller 
    in the splash page i have to call the getbuilder hear to avoid
     deleting the e popular and recommended product controller 
      after navigat to the home page
     */
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: RoutsHelper.getSplashePage(),
            getPages: RoutsHelper.routs,
          );
        },);
      },
    );
  }
}
