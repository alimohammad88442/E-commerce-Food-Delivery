import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class MainFoodpage extends StatefulWidget {
  const MainFoodpage({super.key});

  @override
  State<MainFoodpage> createState() => _MainFoodpageState();
}

Future<void> loadResources() async {
  //this method is to load the data from the server
  await Get.find<PopularProductController>().getpopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedductList();
}

class _MainFoodpageState extends State<MainFoodpage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: loadResources,
        child:  Column(
          children: [
            SizedBox(
              child: Container(
                margin: const EdgeInsets.only(top: 45, bottom: 15),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        BigText(
                          text: 'syria',
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'Damascuse',
                              color: Colors.black45,
                            ),
                            Icon(Icons.arrow_drop_down_circle_rounded)
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius16),
                        color: AppColors.mainColor,
                      ),
                      child: const Icon(Icons.search),
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
                child: SingleChildScrollView(
              child: FoodPageBody(),
            ))
          ],
        ));
  }
}
