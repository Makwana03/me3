import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_fashion__1/cantroller/category_cantroller.dart';
import 'package:open_fashion__1/cantroller/home_page_cantroller.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';
import 'package:open_fashion__1/widgets/contact_details.dart';
import 'package:open_fashion__1/widgets/grid_card.dart';
import 'dart:math' as math;

class Categoriescreen extends StatefulWidget {
  Categoriescreen({super.key});

  @override
  State<Categoriescreen> createState() => _CategoriescreenState();
}

class _CategoriescreenState extends State<Categoriescreen> {
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
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => InkWell(child: _buildDot(index), onTap: (){_currentPage = index;setState(() {
            
          });},),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: whiteColor),
        color: _currentPage == index ? blackColor.withOpacity(0.8) : greyColor,
      ),
      child: Text(
        '${index + 1}',
        style: TextStyle(
            color: _currentPage != index
                ? blackColor.withOpacity(0.8)
                : whiteColor,
            fontFamily: 'mp',
            fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  final ProductController productController = ProductController();
  Widget _buildGridItem(int index) {
    return GridItem(
      height: 120,
      width: 140,
      image: categorylst[index].images,
      isCenter: true,
      productname: categorylst[index].name,
      subname: categorylst[index].subname,
      price: categorylst[index].price,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = getScreenHeight(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommonAppBarScreen(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemBuilder: (context, index) {
                  return CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.only(left: 9.0),
                        sliver: SliverGrid(
                          gridDelegate:
                               SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 0.0,
                            childAspectRatio: screenHeight * 0.000778061,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return SizedBox(
                                height: screenHeight * 0.229591837,
                                child: _buildGridItem(index),
                              );
                            },
                            childCount: categorylst.length,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                             _currentPage >0 ?   IconButton(
                                  onPressed: () {
                                    setState(() {
                                      print("Tap");
                                      _currentPage = _currentPage - 1;
                                    });
                                  },
                                  icon:
                                      const Icon(Icons.arrow_back_ios_rounded),
                                ) : SizedBox.shrink(),
                                const SizedBox(width: 5),
                                 _buildBottomNavigationBar(),
                                
                                const SizedBox(width: 5),
                                Visibility(
                                   visible:   _currentPage <4 ,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentPage = _currentPage + 1;
                                      });
                                    },
                                    icon: const Icon(
                                        Icons.arrow_forward_ios_rounded),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(
                              height: 70,
                            ),
                            const ContactDetails()
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


