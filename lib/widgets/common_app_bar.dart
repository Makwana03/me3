import 'package:flutter/material.dart';
import 'package:open__fashion/utils/constans.dart';

class CommonAppBarScreen extends StatelessWidget {
  const CommonAppBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu_open_sharp),
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
          icon: Icon(Icons.search_outlined),
          onPressed: () {
            // Add your first action button action here
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_bag_outlined),
          onPressed: () {
            // Add your second action button action here
          },
        ),
      ],
    );
  }
}
