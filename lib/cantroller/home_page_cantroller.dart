// controller.dart
import 'package:flutter/material.dart';
import 'package:open_fashion__1/model/home_page_model.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/view/product_view.dart';

class ProductController extends ChangeNotifier {
  List<Product> products = [
    Product(name: 'Product 1', imageUrl: 'url1', price: 120),
    Product(name: 'Product 2', imageUrl: 'url2', price: 120),
    Product(name: 'Product 3', imageUrl: 'url3', price: 120),
    Product(name: 'Product 4', imageUrl: 'url4', price: 120),
  ];
}

class mygrid extends StatelessWidget {
  const mygrid(
      {super.key,
      required this.height,
      required this.width,
      required this.image,
      required this.isCenter});
  final double height;
  final String image;
  final double width;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    return InkWell
  (
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context) =>const ProductDetailView(),));
    },
      child: Column(
        crossAxisAlignment:
            isCenter ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.fill,
                height: height,
                width: width,
              ),
            ],
          ),
          Text(
            '21WN reversible angora',
            style: TextStyle(fontFamily: 'mp', fontSize: myheight / 77),
          ),
          Text(
            'Cardigan',
            style: TextStyle(fontFamily: 'mp', fontSize: myheight / 77),
          ),
          Text(
            "\$120",
            style: TextStyle(
                fontFamily: 'mp', color: goldColor, fontSize: myheight / 70),
          )
        ],
      ),
    );
  }
}