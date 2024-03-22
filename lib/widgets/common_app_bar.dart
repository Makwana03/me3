import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/view/check_2.dart';
import 'package:open_fashion__1/view/checkout_view.dart';
import 'package:open_fashion__1/view/product_view.dart';

class CommonAppBarScreen extends StatelessWidget {
  const CommonAppBarScreen({
    this.isHomeScreen = false,
    this.isCheckout = false,
    this.count2 = 0,
    this.isCart = false,
  });
  final int count2;
  final bool isCart;
  final bool isHomeScreen;
  final bool isCheckout;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if (!isHomeScreen) {
            if (count2 > 0) {
              for (var i = 0; i < count2; i++) {
                Navigator.of(context).pop();
              }
              count = 0;
            } else {
              Navigator.of(context).pop();
            }

            print("Button Pressed");
          }
        },
        icon: Icon(Icons.arrow_back_ios_rounded),
      ),
      backgroundColor: whiteColor,
      title: Align(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/svg/Logo.svg',
          width: 120,
          height: 35,
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        InkWell(
          child: isCart
              ? SizedBox(
                  width: 1,
                )
              : Obx(
                  () => badges.Badge(
                    // position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    
                    badgeAnimation: badges.BadgeAnimation.scale(),
                    badgeStyle: badges.BadgeStyle(

        
                        badgeColor: goldColor.withOpacity(0.8)),
                    badgeContent: Text(
                      cartManager.items.value != null
                          ? cartManager.items.value!.length.toString()
                          : "0",
                      style: TextStyle(fontSize: 12,color: blackColor),
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/s_bag.svg',
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => first(),
            ));
          },
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
