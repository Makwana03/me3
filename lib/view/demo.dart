import 'package:flutter/material.dart';
import 'package:open_fashion__1/model/category_model.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';
import 'package:open_fashion__1/widgets/contact_details.dart';
import 'package:open_fashion__1/widgets/grid_card.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key, required this.dataModel});
  final List<ProductDetail> dataModel;

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  void dispose() {
    super.dispose();
  }

  // final List<String> _currentItems =
  //     List.generate(4, (index) => 'Item ${index + 1}');

  // int _currentPage = 0;

  // Widget _buildDot(int index) {
  //   print(widget.dataModel.length);
  //   return Container(
  //     width: 30,
  //     height: 30,
  //     margin: const EdgeInsets.symmetric(horizontal: 4),
  //     decoration: BoxDecoration(
  //       shape: BoxShape.rectangle,
  //       border: Border.all(color: whiteColor),
  //       color: _currentPage == index
  //           ? blackColor.withOpacity(0.8)
  //           : greyColor.withOpacity(0.2),
  //     ),
  //     child: Text(
  //       '${index + 1}',
  //       style: TextStyle(
  //           color: _currentPage != index
  //               ? blackColor.withOpacity(0.8)
  //               : whiteColor,
  //           fontFamily: 'mp',
  //           fontSize: 18),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  Widget _buildGridItem(
       double height, double width, ProductDetail productDetail) {
    return Container(
      height: height,
      width: width,
      child: GridItem(
        height: height,
        model: productDetail,
        isCenter: true,
      ),
    );
  }

  // Widget _buildBottomNavigationBar() {
  //   return SizedBox(
  //     height: 60,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: List.generate(
  //         5,
  //         (index) => InkWell(
  //           // child: _buildDot(index),
  //           onTap: () {
  //             // _currentPage = index;
  //             setState(() {});
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommonAppBarScreen(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: [
            GridView.count(
              shrinkWrap: true,
              childAspectRatio: 0.64,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: widget.dataModel.map((item) {
                return Container(
                  height: 300,
                  child: _buildGridItem(
                      
                      MediaQuery.of(context).size.width * 0.55,
                      MediaQuery.of(context).size.width * 0.178571429,
                      item),
                );
              }).toList(),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     _currentPage > 0
            //         ? IconButton(
            //             onPressed: () {
            //               setState(() {
            //                 _currentPage = _currentPage - 1;
            //               });
            //             },
            //             icon: const Icon(Icons.arrow_back_ios_rounded),
            //           )
            //         : const SizedBox.shrink(),
            //     const SizedBox(width: 5),
            //     _buildBottomNavigationBar(),
            //     const SizedBox(width: 5),
            //     Visibility(
            //       visible: _currentPage < 4,
            //       child: IconButton(
            //         onPressed: () {
            //           setState(() {
            //             _currentPage = _currentPage + 1;
            //           });
            //         },
            //         icon: const Icon(Icons.arrow_forward_ios_rounded),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 35),
           
            const ContactDetails(),
          ],
        ),
      ),
    );
  }
}
