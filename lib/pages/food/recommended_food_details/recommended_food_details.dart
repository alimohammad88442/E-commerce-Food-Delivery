import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/pages/food/recommended_food_details/recommended_food_details_widgets/recommended_food_details_bottom_name.dart';
import 'package:food_delivery/pages/food/recommended_food_details/recommended_food_details_widgets/recommended_food_details_bottom_navigation_bar.dart';
import 'package:food_delivery/pages/food/recommended_food_details/recommended_food_details_widgets/recommended_food_details_title.dart';
import 'package:food_delivery/utils/constans.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails(
      {super.key, required this.pageId, required this.page});
  final int pageId;
  final String page;
  @override
  Widget build(BuildContext context) {
    var productModel =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), productModel);
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: RecommendedFoodDetailsTitle(page: page),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: RecommendedFoodDetailsBottomName(
                    productModel: productModel),
              ),
              pinned: true,
              backgroundColor: Colors.yellowAccent,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  Appconstants.baseUrl +
                      Appconstants.uploadUrl +
                      productModel.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    child: ExpandableText(
                      text: productModel.description!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return RecommendedFoodDetailsBottomNavigationBar(
              controller: controller,
              productModel: productModel,
            );
          },
        ),);
  }
}

