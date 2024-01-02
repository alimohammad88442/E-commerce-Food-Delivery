import 'package:flutter/material.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/user_controller.dart';
import 'package:food_delivery/pages/account/widgets/account_item.dart';
import 'package:food_delivery/pages/account/widgets/account_login.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool userLoggedIn = Get.find<Authcontroller>().userLoggedIn();
    if (userLoggedIn) {
      Get.find<Usercontroller>().getUserInfo();
    }
    return GetBuilder<Usercontroller>(builder: (usercontroller) {
      return userLoggedIn
          ? (usercontroller.isloading
              ? Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: Dimensions.height20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcon(
                          icon: Icons.person,
                          backGroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconsize: Dimensions.height45 + Dimensions.height30,
                          size: Dimensions.height15 * 10),
                      SizedBox(height: Dimensions.height30),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AccountItem(
                                appIcon: AppIcon(
                                  icon: Icons.person,
                                  backGroundColor: AppColors.mainColor,
                                  iconColor: Colors.white,
                                  iconsize: Dimensions.height10 * 5 / 2,
                                  size: Dimensions.height10 * 5,
                                ),
                                bigText: BigText(
                                    text: usercontroller.userModel.name),
                              ),
                              SizedBox(height: Dimensions.height20),
                              AccountItem(
                                appIcon: AppIcon(
                                  icon: Icons.phone,
                                  backGroundColor: AppColors.mainColor,
                                  iconColor: Colors.white,
                                  iconsize: Dimensions.height10 * 5 / 2,
                                  size: Dimensions.height10 * 5,
                                ),
                                bigText: BigText(
                                    text: usercontroller.userModel.phone),
                              ),
                              SizedBox(height: Dimensions.height20),
                              AccountItem(
                                appIcon: AppIcon(
                                  icon: Icons.email_rounded,
                                  backGroundColor: AppColors.mainColor,
                                  iconColor: Colors.white,
                                  iconsize: Dimensions.height10 * 5 / 2,
                                  size: Dimensions.height10 * 5,
                                ),
                                bigText: BigText(
                                    text: usercontroller.userModel.email),
                              ),
                              SizedBox(height: Dimensions.height20),
                              AccountItem(
                                appIcon: AppIcon(
                                  icon: Icons.location_on_outlined,
                                  backGroundColor: AppColors.mainColor,
                                  iconColor: Colors.white,
                                  iconsize: Dimensions.height10 * 5 / 2,
                                  size: Dimensions.height10 * 5,
                                ),
                                bigText: const BigText(text: 'location'),
                              ),
                              SizedBox(height: Dimensions.height20),
                              AccountItem(
                                appIcon: AppIcon(
                                  icon: Icons.messenger_outline_rounded,
                                  backGroundColor: AppColors.mainColor,
                                  iconColor: Colors.white,
                                  iconsize: Dimensions.height10 * 5 / 2,
                                  size: Dimensions.height10 * 5,
                                ),
                                bigText: const BigText(text: 'messages'),
                              ),
                              SizedBox(height: Dimensions.height20),
                              GestureDetector(
                                onTap: () {
                                  if (Get.find<Authcontroller>()
                                      .userLoggedIn()) {
                                    Get.find<Authcontroller>()
                                        .clearSharedData();
                                    Get.find<CartController>().clear();
                                    Get.find<CartController>()
                                        .clearCartHistory();
                                    Get.toNamed(RoutsHelper.getSignInPage());
                                  } else {}
                                },
                                child: AccountItem(
                                  appIcon: AppIcon(
                                    icon: Icons.logout,
                                    backGroundColor: AppColors.mainColor,
                                    iconColor: Colors.white,
                                    iconsize: Dimensions.height10 * 5 / 2,
                                    size: Dimensions.height10 * 5,
                                  ),
                                  bigText: const BigText(text: 'loguot'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const CircularProgressIndicator())
          : const AccountLogin();
    });
  }
}


