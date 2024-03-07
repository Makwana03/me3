import 'package:flutter/cupertino.dart';
import 'package:open_fashion__1/cantroller/home_page_cantroller.dart';
import 'package:open_fashion__1/model/category_model.dart';

class TabPage extends StatelessWidget {
   const TabPage({super.key ,required this.list});
final List<ProductDetail> list; 
  @override
  Widget build(BuildContext context) {
      double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return  SizedBox(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: myheight * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      mygrid(
                          height: myheight / 4,
                          width: mywidth / 2.4,
                          image: list[0].displayImage,
                          isCenter: false),
                      SizedBox(
                        height: myheight * 0.02,
                      ),
                      mygrid(
                          height: myheight / 4,
                          width: mywidth / 2.4,
                          image: list[3].displayImage,
                          isCenter: false),
                    ],
                  ),
                ),
                SizedBox(
                  height: myheight * 0.05,
                ),
                Column(
                  children: [
                    mygrid(
                        height: myheight / 4,
                        width: mywidth / 2.4,
                        image: list[2].displayImage,
                        isCenter: false),
                    SizedBox(
                      height: myheight * 0.02,
                    ),
                    mygrid(
                        height: myheight / 4,
                        width: mywidth / 2.4,
                        image: list[1].displayImage,
                        isCenter: false),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}