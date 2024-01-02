import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         BigText(text: text , size: Dimensions.font26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.yellow,
                      )),
            ),
            const SizedBox(
              width: 4,
            ),
            const SmallText(text: '4,5'),
            const SizedBox(
              width: 4,
            ),
            const SmallText(text: '1234'),
            SizedBox(
              width: Dimensions.height10 -5,
            ),
            const SmallText(text: 'comments'),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
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
    );
  }
}
