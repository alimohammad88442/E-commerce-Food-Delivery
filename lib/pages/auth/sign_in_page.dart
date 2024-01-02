import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/show_custmo_snackbar.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void login(Authcontroller authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (email.isEmpty) {
        showCustomSnackbar(message: 'Type your email', title: 'email');
      } else if (GetUtils.isEmail(email)) {
        showCustomSnackbar(message: 'Type a valid email', title: 'valid email');
      } else if (password.isEmpty) {
        showCustomSnackbar(message: 'Type your password', title: 'password');
      } else if (password.length < 6) {
        showCustomSnackbar(
            message: 'Your password most be at lest 6 charcter',
            title: 'short password');
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RoutsHelper.getInitial());
          } else {
            showCustomSnackbar(message: status.message);
          }
        });
      }
    }

    return Scaffold(
      body: GetBuilder<Authcontroller>(
        builder: (controller) {
          return !controller.isloading
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.25,
                        child: const Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage:
                                AssetImage('assets/images/splash.png'),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                  fontSize: Dimensions.font20 * 3 +
                                      Dimensions.font20 / 2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Sign in to your account',
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                      ApptextField(
                          textController: emailController,
                          hintText: 'Email',
                          icon: Icons.email),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      ApptextField(
                          textController: passwordController,
                          hintText: 'Password',
                          isObscure: true,
                          icon: Icons.password_sharp),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      SizedBox(height: Dimensions.height20),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: Dimensions.font20),
                                text: 'sign into your account'),
                          ),
                          const SizedBox(
                            width: 7,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          login(controller);
                        },
                        child: Container(
                          height: Dimensions.screenHeight / 13,
                          width: Dimensions.screenWidth / 2,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: 'Sign In',
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: Dimensions.font20 * 0.5),
                          text: 'Don\'t have an account',
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => const SignupPage(),
                                    transition: Transition.fade),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: Dimensions.font20 * 0.5),
                              text: 'Creat',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator();
        },
      ),
    );
  }
}
