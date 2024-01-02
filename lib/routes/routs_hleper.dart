import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/cart/cart_page/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_details/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommended_food_details/recommended_food_details.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RoutsHelper {
  static const String splashPage = '/spalsh-page';
  static const String initial = '/';
  static const String popularFoodDetails = '/Popula-Food-Details';
  static const String recommendedFoodDetails = '/Recommended-Food-Details';
  static const String cartFood = '/Cart-Food';
  static const String homefood = '/Popular-Food';
  static const String signIn = '/signin';
  static String getInitial() => initial;
  static String getSplashePage() => splashPage;
  static String getPopularFoodDetails(int pageId, String page) =>
      '$popularFoodDetails?pageId=$pageId&page=$page';
  static String getRecommendedFoodDetails(int pageId, String page) =>
      '$recommendedFoodDetails?pageId=$pageId&page=$page';
  static String getCartFood() => cartFood;
  static String getSignInPage() => signIn;

  static List<GetPage> routs = [
    GetPage(
        name: initial,
        page: () => const HomePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: popularFoodDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartFood,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: splashPage,
        page: () {
          return SplashPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFoodDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetails(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signIn,
        page: () => const SignInPage(),
        
        transition: Transition.fadeIn),
  ];
}
