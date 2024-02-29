import 'package:flutter/material.dart';

import 'package:open_fashion__1/utils/constans.dart';

class GridItem extends StatelessWidget {
  const GridItem(
      {super.key,
      required this.height,
      required this.width,
      required this.image,
      required this.isCenter,
      required this.productname,
      required this.subname,
      required this.price});
  final double height;
  final String image;
  final double width;
  final bool isCenter;
  final String productname;
  final String subname;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment:
            isCenter ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: height,
                // height: double.maxFinite -50,
                width: double.maxFinite,
                // height: 200,
              ),
              Positioned(
                bottom: -10,
                right: -10,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: goldColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Text(
            productname,
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'mp',
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              fontSize: MediaQuery.sizeOf(context).height * 0.02,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: Text(
              subname,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'mp',
                  fontSize: MediaQuery.sizeOf(context).height * 0.015),
            ),
          ),
          Text(
            price,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontFamily: 'mp',
                color: goldColor,
                fontSize: MediaQuery.sizeOf(context).height * 0.018),
          )
        ],
      ),
    );
  }
}
