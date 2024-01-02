 import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account/widgets/account_app_bar.dart';
import 'package:food_delivery/pages/account/widgets/account_body.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AccountAppBar() ,
      body: AccountBody() ,
    );
  }
}
