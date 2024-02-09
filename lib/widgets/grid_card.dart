import 'package:flutter/material.dart';
import 'package:open__fashion/utils/constans.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/image.png',
              fit: BoxFit.cover,
              // width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.favorite_border),
                color: goldColor,
                onPressed: () {
                  // Add your favorite action here
                },
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     color: Colors.black.withOpacity(0.5),
            //     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            //     child: const Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(
            //           "title",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         Text(
            //           "subTitle",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
