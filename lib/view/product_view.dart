import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/view/checkout_view.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

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
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double currentHeight = getScreenHeight(context);
    // double currentHeight = getScreenHeight(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(currentHeight * 0.076530612),
        child: const CommonAppBarScreen(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: currentHeight * 0.446428571,
                width: double.infinity,
                child: Image.asset(
                  ringImages[selectedIndex],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: currentHeight * 0.025510204),
              SizedBox(
                height: currentHeight * 0.089285714,
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
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: currentHeight * 0.12755102,
                          decoration: BoxDecoration(
                            border: BorderDirectional(
                              bottom: BorderSide(
                                color: selectedIndex == index
                                    ? goldColor
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          child: Image.asset(
                            ringImages[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: currentHeight * 0.025510204),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "MOHAN",
                        style: TextStyle(
                          fontFamily: "mp",
                          fontSize: 28,
                          letterSpacing: 3,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/svg/upload.svg",
                        height: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Recycle Boucle Knit Cardigan Pink",
                    style: TextStyle(fontFamily: "mp", fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "\$120",
                    style: TextStyle(
                      fontFamily: "mp",
                      fontSize: 22,
                      color: goldColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: currentHeight * 0.01510204),
              Row(
                children: [
                  const Text(
                    "Size",
                    style: TextStyle(fontFamily: "mp", fontSize: 18),
                  ),
                  SizedBox(width: currentHeight * 0.01),
                  Expanded(
                    child: SizedBox(
                      height: currentHeight * 0.0428,
                      child: ListView.builder(
                        itemCount: ringSizes.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedSizeIndex = index;
                                });
                              },
                              child: Container(
                                height: currentHeight * 0.051020408,
                                width: currentHeight * 0.051020408,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedSizeIndex == index
                                      ? const Color(0xff333333)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: greyColor,
                                  ),
                                ),
                                child: Text(
                                  "${ringSizes[index]}",
                                  style: TextStyle(
                                    color: selectedSizeIndex == index
                                        ? whiteColor
                                        : Colors.black,
                                    fontFamily: "mp",
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: currentHeight * 0.051020408,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => first(),
              ));
        },
        child: Container(
          height: currentHeight * 0.076530612,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: const BoxDecoration(color: blackColor),
          child: const Row(
            children: [
              Icon(
                Icons.add,
                color: whiteColor,
                size: 28,
              ),
              SizedBox(width: 15),
              Text(
                "ADD TO BASKET",
                style: TextStyle(
                  fontFamily: "mp",
                  color: whiteColor,
                  fontSize: 20,
                ),
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
