import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';

class ProductDetailView extends StatefulWidget {
  ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  List<String> ringImages = [
    "assets/images/ring_normal.jpg",
    "assets/images/ring_front.jpg",
    "assets/images/ring_side.jpg",
    "assets/images/f.jpg"
  ];

  int selectedIndex = 0;

  List<int> ringSizes = [6, 8, 9, 10, 11];
  int selectedsizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double currentHieght = getScreenHeight(context);
    double currentWidth = getScreenWidth(context);
    return Scaffold(
      appBar:const PreferredSize(
          preferredSize: Size.fromHeight(60), child: CommonAppBarScreen()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 10),
                height: 350,
                // height: Get.height * 0.30,
                width: double.infinity,
                child: Image.asset(
                  ringImages[selectedIndex],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                // height: Get.height * 0.050,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ringImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        // padding: const EdgeInsets.all(8.0),
                        height: 100,
                        width: 100,
                        // height: Get.height * 0.1,
                        // width: Get.width * 0.1,

                        decoration: selectedIndex == index
                            ? BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: goldColor)))
                            : const BoxDecoration(),
                        child: Image.asset(
                          ringImages[index],
                          // fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                // height: 100,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "M O H A N",
                          style: TextStyle(fontFamily: "mp", fontSize: 28),
                        ),
                        SvgPicture.asset(
                          "assets/svg/upload.svg",
                          height: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Recycle Boucle Knit Cardigan Pink",
                      style: TextStyle(fontFamily: "mp", fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$120",
                      style: TextStyle(
                          fontFamily: "mp", fontSize: 22, color: goldColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "Ring Size",
                      style: TextStyle(fontFamily: "mp", fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 40,
                      // width: double.infinity,
                      child: ListView.builder(
                        itemCount: ringSizes.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedsizeIndex = index;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: selectedsizeIndex == index
                                    ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff333333),
                                        border: Border.all(color: greyColor))
                                    : BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: greyColor)),
                                child: Text(
                                  "${ringSizes[index]}",
                                  style: selectedsizeIndex == index
                                      ? TextStyle(
                                          color: whiteColor, fontFamily: "mp")
                                      : TextStyle(fontFamily: "mp"),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          height: 60,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(color: blackColor),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: whiteColor,
                size: 28,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "ADD TO BASKET",
                style: TextStyle(
                    fontFamily: "mp", color: whiteColor, fontSize: 20),
              ),
              Spacer(),
              Icon(
                Icons.favorite_border_outlined,
                color: whiteColor,
                size: 28,
              )
            ],
          ),
        ),
      ),
    );
  }
}