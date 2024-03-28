// // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_fashion__1/model/banner_model.dart';

import 'dart:math' as math;

import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/view/demo.dart';
import 'package:open_fashion__1/view/product_view.dart';
import 'package:open_fashion__1/view/tabs.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';
import 'package:open_fashion__1/widgets/contact_details.dart';
import 'package:open_fashion__1/widgets/pogress_indicator.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    homePageCantroller.getCatData(context);
    homePageCantroller.getStoreData(context);
    homePageCantroller.getTabData(context);
    cartManager.getItems();
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
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homePageCantroller.bannerModel.value != null
              ? homePageCantroller.bannerModel.value!.data.length
              : 1,
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

  @override
  Widget build(BuildContext context) {
    double currentHeoght = getScreenHeight(context);
    double currentWidht = getScreenWidth(context);

    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Obx(() => Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CommonAppBarScreen(isHomeScreen: true,),
          ),
          body: RefreshIndicator(
            color: goldColor,
            strokeWidth: 3,
            displacement: 120,
            onRefresh: () async {
              setState(() {
                homePageCantroller.getCatData(context);
                    homePageCantroller.getStoreData(context);

                homePageCantroller.getTabData(context);
              });
            },
            child: SingleChildScrollView(
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
                              homePageCantroller.bannerModel.value?.data != null
                                  ? homePageCantroller
                                      .bannerModel.value?.data.length
                                  : 1,
                          onPageChanged: (value) {
                            setState(() {
                              _currentPage = value;
                            });
                          },
                          itemBuilder: (context, index) {
                            final page = homePageCantroller
                                        .bannerModel.value?.data !=
                                    null
                                ? homePageCantroller
                                    .bannerModel.value?.data[index]
                                : Datum(
                                    id: 1,
                                    image:
                                        'https://res.cloudinary.com/dcm19ly0d/image/upload/v1710561936/Dashboard/image/qetsw0oa9fcufs9ldaqx.png',
                                    imageTitle: '');
                            return _buildPage(page!);
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
                              style: TextStyle(
                                  color: whiteColor, fontFamily: 'mp'),
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
                                    child: LoadingProgressDialog(),
                                  )
                                : _buildBottomNavigationBar()),
                      )
                    ],
                  ),SizedBox(height: myheight * 0.034,),

                  SizedBox(height: myheight * 0.001),
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
                  homePageCantroller.isLoadingCat.value == true
                      ? Center(
                          child: LoadingProgressDialog(),
                        )
                      : homePageCantroller.categorysModel.value == null
                          ?const  SizedBox(
                              height: 1,
                            )
                          : SizedBox(height: currentHeoght * 0.721530612,child:const  CustomTabView()),
                  SizedBox(
                    height: myheight * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShoppingPage(
                              dataModel: homePageCantroller
                                  .categorysModel
                                  .value!
                                  .cat[homePageCantroller.currentTabIndex.value]
                                  .productDetail,
                            ),
                          ));
                    },
                    child: Row(
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
                        const Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: myheight * 0.01,
                  ),
                  SizedBox(
                    height: myheight * 0.02,
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
                                 Text("Unique desings",style: TextStyle(
                                      fontFamily: "mp",
                                      fontSize: myheight / 60,
                                      color: Colors.black87),),
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
                                 Text("Fast shipping",style: TextStyle(
                                      fontFamily: "mp",
                                      fontSize: myheight / 60,
                                      color: Colors.black87),),
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
                                child: LoadingProgressDialog(),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8),
                                child: homePageCantroller.storeModel.value?.store.follow.isEmpty ==
                                        null
                                    ? const SizedBox(
                                        height: 0,
                                      )
                                    : Row(
                                        children: [
                                         
                                          Stack(
                                            children: [
                                              Image.network(
                                                homePageCantroller
                                                    .storeModel
                                                    .value!
                                                    .store
                                                    .follow[0]
                                                    .image,
                                                height: myheight * 0.210459184,
                                                fit: BoxFit.fill,
                                                width: mywidth * 0.458333333,
                                              ),
                                              Positioned(
                                                  bottom: 1,
                                                  left: 5,
                                                  child: Text(
                                                    homePageCantroller
                                                        .storeModel
                                                        .value!
                                                        .store
                                                        .follow[0]
                                                        .name,
                                                    style:const  TextStyle(
                                                        color: whiteColor,
                                                        fontFamily: 'mp'),
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            width: mywidth * 0.03,
                                          ),
                                           homePageCantroller
                                                    .storeModel
                                                    .value!
                                                    .store
                                                    .follow.length<2 ?const SizedBox(): 
                                          Stack(
                                            children: [
                                              Image.network(
                                                homePageCantroller
                                                    .storeModel
                                                    .value!
                                                    .store
                                                    .follow[1]
                                                    .image,
                                                height: myheight * 0.210459184,
                                                fit: BoxFit.fill,
                                                width: mywidth * 0.458333333,
                                              ),
                                              Positioned(
                                                  bottom: 1,
                                                  left: 5,
                                                  child: Text(
                                                    homePageCantroller
                                                        .storeModel
                                                        .value!
                                                        .store
                                                        .follow[1]
                                                        .name,
                                                    style: const TextStyle(
                                                        color: whiteColor,
                                                        fontFamily: 'mp'),
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                              ),
                        homePageCantroller.isLoadingStore.value
                            ? Center(
                                child: LoadingProgressDialog(),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8),
                                child: 
                                homePageCantroller.storeModel.value ==
                                        null
                                    ?const  SizedBox(
                                        height: 0,
                                      ):
                                Row(
                                  children: [
                                    homePageCantroller
                                                    .storeModel
                                                    .value!
                                                    .store
                                                    .follow.length<3?const SizedBox(): 
                                    Stack(
                                      children: [
                                        Image.network(
                                          homePageCantroller.storeModel.value!
                                              .store.follow[2].image,
                                          height: myheight * 0.210459184,
                                          fit: BoxFit.fill,
                                          width: mywidth * 0.458333333,
                                        ),
                                        Positioned(
                                            bottom: 1,
                                            left: 5,
                                            child: Text(
                                              homePageCantroller.storeModel
                                                  .value!.store.follow[2].name,
                                              style:const TextStyle(
                                                  color: whiteColor,
                                                  fontFamily: 'mp'),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      width: mywidth * 0.03,
                                    ),
                                    homePageCantroller
                                                    .storeModel
                                                    .value!
                                                    .store
                                                    .follow.length<4 ?const  SizedBox(): Stack(
                                      children: [
                                        Image.network(
                                          homePageCantroller.storeModel.value!
                                              .store.follow[3].image,
                                          height: myheight * 0.210459184,
                                          fit: BoxFit.fill,
                                          width: mywidth * 0.458333333,
                                        ),
                                        Positioned(
                                            bottom: 1,
                                            left: 5,
                                            child: Text(
                                              homePageCantroller.storeModel
                                                  .value!.store.follow[3].name,
                                              style:const TextStyle(
                                                  color: whiteColor,
                                                  fontFamily: 'mp'),
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
                                child: LoadingProgressDialog(),
                              )
                            :const  ContactDetails(),
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
        ));
  }
}
