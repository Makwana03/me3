// // ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/cantroller/home_page_cantroller.dart';
import 'package:open_fashion__1/view/tab_view.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _key = GlobalKey<FormState>();
  int _currentPage = 0;

  Widget _buildPage(Map<String, dynamic> page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Image.asset(
            page['image'],
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _pages.length,
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

  final List<Map<String, dynamic>> _pages = [
    {
      'image': 'assets/images/banner.png',
    },
    {
      'image': 'assets/images/banner.png',
    },
    {
      'image': 'assets/images/banner.png',
    },
    {
      'image': 'assets/images/banner.png',
    },
  ];

  final ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                  child: PageView.builder(
                    itemCount: _pages.length,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      final page = _pages[index];
                      return _buildPage(page);
                    },
                  ),
                ),
                Positioned.fill(
                  bottom: 50,
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
                      child: _buildBottomNavigationBar()),
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
            Image.asset(
              "assets/images/3.jpg",
            ),
            Container(
              height: 550,
              child: CustomTabView(),
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
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward))
              ],
            ),
            SizedBox(
              height: myheight * 0.00,
            ),
            Container(
              color: Color.fromARGB(255, 242, 242, 242),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  SvgPicture.asset(
                    "assets/svg/Logo.svg",
                  ),
                  SizedBox(
                    height: myheight * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45, right: 45),
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
                          Image.asset(
                            "assets/images/sStriker.png",
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
                          Image.asset(
                            "assets/images/f.jpg",
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
                          Image.asset(
                            "assets/images/g.jpg",
                          ),
                          Text("Unique desings"),
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
                          Image.asset(
                            "assets/images/h.jpg",
                          ),
                          Text("Fast shipping"),
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
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/i.jpg",
                        ),
                        SizedBox(
                          width: mywidth * 0.03,
                        ),
                        Image.asset(
                          "assets/images/j.jpg",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/k.jpg",
                        ),
                        SizedBox(
                          width: mywidth * 0.03,
                        ),
                        Image.asset(
                          "assets/images/l.jpg",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: myheight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.values,
                    children: [
                      SvgPicture.asset("assets/svg/twiter.svg"),
                      SvgPicture.asset("assets/svg/instagram2.svg"),
                      SvgPicture.asset("assets/svg/yt.svg"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SvgPicture.asset(
                    "assets/svg/5.svg",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "support@mp.gmail.com",
                    style: TextStyle(fontFamily: 'mp'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "+60 825 876",
                    style: TextStyle(fontFamily: 'mp'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "08:00 - 20:00 - Everyday",
                    style: TextStyle(fontFamily: 'mp'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    "assets/svg/5.svg",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.values,
                    children: [
                      Text(
                        "About",
                        style: TextStyle(fontFamily: 'mp'),
                      ),
                      Text(
                        "Contact",
                        style: TextStyle(fontFamily: 'mp'),
                      ),
                      Text(
                        "Blog",
                        style: TextStyle(fontFamily: 'mp'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  // SvgPicture.asset("assets/svg/Footer.svg")
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Copyright© OpenUI All Rights Reserved.",
              style: TextStyle(fontFamily: 'mp', fontSize: 12),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
