// // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_fashion__1/model/banner_model.dart';

import 'dart:math' as math;

import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/view/demo.dart';
import 'package:open_fashion__1/view/tabs.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';
import 'package:open_fashion__1/widgets/contact_details.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    print('init');
    homePageCantroller.getCatData(context);
    homePageCantroller.getStoreData(context);
    homePageCantroller.getTabData(context);
    super.initState();
  }

  int _currentPage = 0;

  Widget _buildPage(Datum data) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          data.image,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
        Positioned(
            child: Text(
          "${data.imageTitle} ",
          style: TextStyle(
              fontSize: 45,
              fontFamily: 'mp',
              fontWeight: FontWeight.w900,
              color: blackColor.withOpacity(0.6)),
          textAlign: TextAlign.center,
        )),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    print("Prashant");
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homePageCantroller.bannerModel.value!.data.length,
          (index) => _buildDot(index),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Transform.rotate(
      angle: 45 * (math.pi / 180), // convert degrees to radians
      child: Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: whiteColor),
          color: _currentPage == index ? whiteColor : Colors.transparent,
        ),
      ),
    );
  }

  // final List<Map<String, dynamic>> _pages = [
  //   {
  //     'image': 'assets/images/banner.png',
  //   },
  //   {
  //     'image': 'assets/images/banner.png',
  //   },
  //   {
  //     'image': 'assets/images/banner.png',
  //   },
  //   {
  //     'image': 'assets/images/banner.png',
  //   },
  // ];

  // final ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    double currentHeoght = getScreenHeight(context);
    double currentWidht = getScreenWidth(context);

    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CommonAppBarScreen(),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    // height: ,
                    child: PageView.builder(
                      itemCount:
                          homePageCantroller.bannerModel.value?.data.length,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        final page =
                            homePageCantroller.bannerModel.value?.data[index];
                        return homePageCantroller.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : _buildPage(page!);
                      },
                    ),
                  ),
                  Positioned.fill(
                    bottom: currentHeoght * 0.06377551,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        onPressed: () {},
                        child: const Text(
                          'EXPLORE COLLECTION',
                          style: TextStyle(color: whiteColor, fontFamily: 'mp'),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 5,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: homePageCantroller.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : _buildBottomNavigationBar()),
                  )
                ],
              ),
              SizedBox(height: myheight * 0.04),
              Text(
                "NEW ARRIVAL",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 18,
                    fontFamily: "mp",
                    letterSpacing: 1),
              ),
              SvgPicture.asset(
                "assets/svg/5.svg",
              ),
              SizedBox(
                height: currentHeoght * 0.701530612,
                child: homePageCantroller.isLoadingCat.value == false
                    ? CustomTabView()
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
              SizedBox(
                height: myheight * 0.00,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Explore More",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: blackColor,
                        fontSize: myheight * 0.02,
                        fontFamily: "mp"),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShoppingPage(),
                            ));
                      },
                      icon: const Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(
                height: myheight * 0.00,
              ),
              Container(
                color: const Color.fromARGB(255, 242, 242, 242),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    SvgPicture.asset(
                      "assets/svg/Logo.svg",
                    ),
                    SizedBox(
                      height: myheight * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: myheight * 0.057397959,
                          right: myheight * 0.057397959),
                      child: Text(
                        "Making a Luxurios Lifestyle accessible for a generous group of women is our daily drive",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "mp",
                            fontSize: myheight / 60,
                            color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: myheight * 0.01,
                    ),
                    SvgPicture.asset(
                      "assets/svg/5.svg",
                    ),
                    SizedBox(
                      height: myheight * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/mp6.svg",
                            ),
                            Text(
                              "Fast Shiping. Free on",
                              style: TextStyle(
                                  fontFamily: "mp",
                                  fontSize: myheight / 60,
                                  color: Colors.black87),
                            ),
                            Text(
                              " order over  \$25.",
                              style: TextStyle(
                                  fontFamily: "mp",
                                  fontSize: myheight / 60,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                        SizedBox(
                          width: mywidth * 0.05,
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/mp2.svg",
                            ),
                            Text(
                              "Sustainable process",
                              style: TextStyle(
                                  fontFamily: "mp",
                                  fontSize: myheight / 60,
                                  color: Colors.black87),
                            ),
                            Text(
                              "from start to finish.",
                              style: TextStyle(
                                  fontFamily: "mp",
                                  fontSize: myheight / 60,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: myheight * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/mp3.svg",
                            ),
                            const Text("Unique desings"),
                            Text(
                              "and high quality materials.",
                              style: TextStyle(
                                  fontFamily: "mp",
                                  fontSize: myheight / 60,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                        SizedBox(
                          width: mywidth * 0.05,
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/mp5.svg",
                            ),
                            const Text("Fast shipping"),
                            Text(
                              "free order over  \$25.",
                              style: TextStyle(
                                  fontFamily: "mp",
                                  fontSize: myheight / 60,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: myheight * 0.05,
                    ),
                    SvgPicture.asset(
                      "assets/svg/dash.svg",
                    ),
                    SizedBox(
                      height: myheight * 0.04,
                    ),
                    Text(
                      "FOLLOW US",
                      style: TextStyle(
                          fontFamily: "mp",
                          fontSize: myheight / 40,
                          letterSpacing: 1,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: myheight * 0.02,
                    ),
                    SvgPicture.asset(
                      "assets/svg/instagram.svg",
                    ),
                    SizedBox(
                      height: myheight * 0.02,
                    ),
                    homePageCantroller.isLoadingStore.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Image.network(
                                      homePageCantroller.storeModel.value!.store
                                          .follow[0].image,
                                      height: myheight * 0.210459184,
                                      fit: BoxFit.fill,
                                      width: mywidth * 0.458333333,
                                    ),
                                    Positioned(
                                        bottom: 1,
                                        left: 5,
                                        child: Text(
                                          homePageCantroller.storeModel.value!
                                              .store.follow[0].name,
                                          style: TextStyle(color: whiteColor,fontFamily: 'mp'),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: mywidth * 0.03,
                                ),
                                Stack(
                                  children: [
                                    Image.network(
                                      homePageCantroller.storeModel.value!.store
                                          .follow[1].image,
                                      height: myheight * 0.210459184,
                                      fit: BoxFit.fill,
                                      width: mywidth * 0.458333333,
                                    ),
                                    Positioned(
                                        bottom: 1,
                                        left: 5,
                                        child: Text(
                                          homePageCantroller.storeModel.value!
                                              .store.follow[1].name,
                                          style: TextStyle(color: whiteColor,fontFamily: 'mp'),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                    homePageCantroller.isLoadingStore.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Image.network(
                                      homePageCantroller.storeModel.value!.store
                                          .follow[2].image,
                                      height: myheight * 0.210459184,
                                      fit: BoxFit.fill,
                                      width: mywidth * 0.458333333,
                                    ),
                                    Positioned(
                                        bottom: 1,
                                        left: 5,
                                        child: Text(
                                          homePageCantroller.storeModel.value!
                                              .store.follow[2].name,
                                          style: TextStyle(color: whiteColor,fontFamily: 'mp'),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: mywidth * 0.03,
                                ),
                                Stack(
                                  children: [
                                    Image.network(
                                      homePageCantroller.storeModel.value!.store
                                          .follow[3].image,
                                      height: myheight * 0.210459184,
                                      fit: BoxFit.fill,
                                      width: mywidth * 0.458333333,
                                    ),
                                    Positioned(
                                        bottom: 1,
                                        left: 5,
                                        child: Text(
                                          homePageCantroller.storeModel.value!
                                              .store.follow[3].name,
                                          style: TextStyle(color: whiteColor,fontFamily: 'mp'),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: myheight * 0.03,
                    ),
                    homePageCantroller.isLoadingStore.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ContactDetails(),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Copyright© OpenUI All Rights Reserved.",
                style: TextStyle(fontFamily: 'mp', fontSize: 12),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
