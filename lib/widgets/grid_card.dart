import 'package:flutter/material.dart';
import 'package:open_fashion__1/utils/constans.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key , required this.height , required this.width ,required this.image , required this.isCenter});
  final double height;
  final String image;
  final double width;
  final bool isCenter;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:isCenter ?  CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: height,
              width: width,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                color: goldColor,
                onPressed: () {
                },
              ),
            ),
           
          ],
        ),
        const Text(
          'Title Here',
          style: TextStyle(
              fontFamily: 'mp', fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Text(
          'Second Title Here',
          style: TextStyle(fontFamily: 'mp'),
        ),
        const Text(
          "\$100",
          style: TextStyle(fontFamily: 'mp', color: goldColor, fontSize: 15),
        )
      ],
    );
  }
}
