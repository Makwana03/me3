import 'package:flutter/material.dart';
import 'package:open_fashion__1/model/category_model.dart';

import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/view/product_view.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.height,
    required this.isCenter,
    required this.model,
  });
  final ProductDetail model;
  final double height;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailView(model: model),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment:
              isCenter ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.network(
                  model.displayImage,
                  fit: BoxFit.fill,
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
            const SizedBox(
              height: 5,
            ),
            Text(
              model.productName,
              //textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'mp',
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 5,
              ),
              child: Text(
                model.productDetail,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'mp',
                    fontSize: 12),
              ),
            ),
            Text(
              '\$${model.productPrice}',
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'mp',
                  color: goldColor,
                  fontSize: 13.5),
            )
          ],
        ),
      ),
    );
  }
}
