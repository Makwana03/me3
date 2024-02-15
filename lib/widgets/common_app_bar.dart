import 'package:flutter/material.dart';

import '../utils/constans.dart';

class CommonAppBarScreen extends StatelessWidget {
  const CommonAppBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu_open_sharp),
        onPressed: () {},
      ),
      backgroundColor: whiteColor,
      title: Image.asset(
        'assets/images/logo.png',
        width: 120,
        height: 30,
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {
            // Add your first action button action here
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined),
          onPressed: () {
            // Add your second action button action here
          },
        ),
      ],
    );
  }
}
