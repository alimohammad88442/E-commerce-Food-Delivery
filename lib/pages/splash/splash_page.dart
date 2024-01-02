import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  Future<void> loadResources() async {
    //this method is to load the data from the server
    await Get.find<PopularProductController>().getpopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedductList();
  }

  @override
  void initState() {
    super.initState();
    loadResources();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);

    Timer(
      const Duration(seconds: 3),
      () {
        Get.offNamed(RoutsHelper.initial);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Image.asset(
                'assets/images/splash.png',
                width: 250,
              ),
            ),
            const Text('the best food')
          ],
        ),
      ),
    );
  }
}
