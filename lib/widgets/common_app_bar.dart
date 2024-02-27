import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/constans.dart';

class CommonAppBarScreen extends StatelessWidget {
  const CommonAppBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Align(
        alignment: Alignment.center,

        child: Transform.scale(
            // height: 30,
            // width: 30,
            scale: 0.9,
            child: SvgPicture.asset(
              'assets/svg/menu.svg',
              height: 30,
              width: 30,
            )),
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
          child: SvgPicture.asset(
            'assets/svg/ss.svg',
            height: 25,
            width: 25,
          ),
          onTap: () {},
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          child: SvgPicture.asset(
            'assets/svg/s_bag.svg',
            height: 25,
            width: 25,
          ),
          onTap: () {},
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
