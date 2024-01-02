import 'package:flutter/material.dart';
import 'package:food_delivery/routes/routs_hleper.dart';
import 'package:get/get.dart';

class AccountLogin extends StatelessWidget {
  const AccountLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutsHelper.getSignInPage());
      },
      child: const Center(
        child: Text('you must login first ',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
            )),
      ),
    );
  }
}