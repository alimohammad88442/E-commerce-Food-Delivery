import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/show_custmo_snackbar.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    List signUpImages = [
      'assets/images/facebook.png',
      'assets/images/google.jpeg',
      'assets/images/twitter.png',
    ];
    void registration(Authcontroller authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (name.isEmpty) {
        showCustomSnackbar(message: 'Type your name', title: 'name');
      } else if (phone.isEmpty) {
        showCustomSnackbar(message: 'Type your phone', title: 'phone');
      } else if (email.isEmpty) {
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
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, password: password, email: email);
        authController.registretion(signUpBody).then((status) {
          if (status.isSuccess) {
              Get.offNamed(RoutsHelper.getInitial());
          } else {
            showCustomSnackbar(message: status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<Authcontroller>(
          builder: (controller) {
            return !controller.isloading ? SingleChildScrollView(
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
                        backgroundImage: AssetImage('assets/images/splash.png'),
                      ),
                    ),
                  ),
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
                  ApptextField(
                      textController: nameController,
                      hintText: 'Name',
                      icon: Icons.person),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  ApptextField(
                      textController: phoneController,
                      hintText: 'phone',
                      icon: Icons.phone),
                  GestureDetector(
                    onTap: () {
                      registration(controller);
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
                          text: 'Sign UP',
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
                            color: Colors.grey, fontSize: Dimensions.font20),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: 'have An account already'),
                  ),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.05,
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: Dimensions.font20 * 0.5),
                        text: 'Sing Up useing ...'),
                  ),
                  Wrap(
                    children: List.generate(
                      3,
                      (index) => CircleAvatar(
                        radius: Dimensions.radius30,
                        backgroundImage: AssetImage(signUpImages[index]),
                      ),
                    ),
                  )
                ],
              ),
            ): const CircularProgressIndicator();
          },
        ));
  }
}
