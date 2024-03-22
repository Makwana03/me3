import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_fashion__1/cantroller/home_page_cantroller.dart';
import 'package:open_fashion__1/model/category_model.dart';
import 'package:open_fashion__1/utils/constans.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key, required this.list});
  final List<ProductDetail> list;
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
      
        height: list.length == 0 ? 10 : myheight,
               

        child:list.isEmpty?const SizedBox(): Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  mygrid(
                      height: myheight / 4,
                      model: list[0],
                      width: mywidth / 2.4,
                      isCenter: true),
                  mygrid(
                      height: myheight / 4,
                      width: mywidth / 2.4,
                      model: list[1],
                      isCenter: true),
                ],
              ),
            ),
            list.length <= 2
                ? const SizedBox(
                    height: 1,
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mygrid(
                            model: list[2],
                            height: myheight / 4,
                            width: mywidth / 2.4,
                            isCenter: true),
                        list.length < 4
                            ?const SizedBox()
                            : mygrid(
                                height: myheight / 4,
                                model: list[3],
                                width: mywidth / 2.4,
                                isCenter: true),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
