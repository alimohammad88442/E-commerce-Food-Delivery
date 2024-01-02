import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/models/prducts_model.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/constans.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var currPageValue = 0.0;
  double scalfactor = 0.8;
  double height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //popular food
        GetBuilder<PopularProductController>(
          builder: (popularproduct) {
            return popularproduct.isloaging
                ? SizedBox(
                    height: Dimensions.pageView,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: popularproduct.popularProductList.length,
                      itemBuilder: (context, index) {
                        return buildPageItem(
                          index,
                          popularproduct.popularProductList[index],
                        );
                      },
                    ),
                  )
                : const CircularProgressIndicator();
          },
        ),
        //dots
        GetBuilder<PopularProductController>(builder: (popularporduct) {
          return DotsIndicator(
            dotsCount: popularporduct.popularProductList.isEmpty
                ? 4
                : popularporduct.popularProductList.length,
            position: currPageValue.toInt(),
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius16),
              ),
            ),
          );
        }),
        SizedBox(height: Dimensions.height20),

        Container(
          margin: EdgeInsets.only(left: Dimensions.height20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Recommended'),
              SizedBox(
                width: Dimensions.height10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.height10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const SmallText(text: 'food pairing'),
              ),
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return recommendedListView(
                    index, recommendedProduct.recommendedProductList[index]);
              });
        })
      ],
    );
  }

  Widget recommendedListView(int index, ProductModel recommendedProduct) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutsHelper.getRecommendedFoodDetails(index , 'home'));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Container(
              height: Dimensions.listViewImgSize,
              width: Dimensions.listViewImgSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                      image: NetworkImage(Appconstants.baseUrl +
                          Appconstants.uploadUrl +
                          recommendedProduct.img!))),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: Dimensions.listViewcontSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white24,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(text: recommendedProduct.name!),
                      SizedBox(height: Dimensions.height10),
                      const SmallText(text: 'whith all love'),
                      SizedBox(height: Dimensions.height10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndText(
                            
                              text: 'normal',
                              icon: Icons.circle_sharp,
                              iconColor: AppColors.iconColor1),
                          IconAndText(
                              text: '1.7 KM',
                              icon: Icons.location_on,
                              iconColor: AppColors.mainColor),
                          IconAndText(
                              text: '25 min',
                              icon: Icons.access_time_rounded,
                              iconColor: AppColors.iconColor2),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currscale = 1 - (currPageValue - index) * (1 - scalfactor);
      var currtrans = height * (1 - currscale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currscale =
          scalfactor + (currPageValue - index + 1) * (1 - scalfactor);
      var currtrans = height * (1 - currscale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currscale = 1 - (currPageValue - index) * (1 - scalfactor);

      var currtrans = height * (1 - currscale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else {
      var currscale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, height * (1 - scalfactor) / 2, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RoutsHelper.getPopularFoodDetails(index , 'home'));
            },
            child: Container(
              height: height,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(Appconstants.baseUrl +
                      Appconstants.uploadUrl +
                      popularProduct.img!),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: const EdgeInsets.only(left: 70, right: 70, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: AppColumn(
                    text: popularProduct.name!,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
