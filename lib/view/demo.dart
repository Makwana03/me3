import 'package:flutter/material.dart';
import 'package:open_fashion__1/cantroller/category_cantroller.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';
import 'package:open_fashion__1/widgets/contact_details.dart';
import 'package:open_fashion__1/widgets/grid_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingPage(),
    );
  }
}

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int _currentPageIndex = 0;

  // List of items for the current page
  List<String> _currentItems = List.generate(10, (index) => 'Item ${index + 1}');

  // List of items for the next page
  List<String> _nextItems = List.generate(10, (index) => 'Next Item ${index + 1}');
  int _currentPage = 0;

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

  Widget _buildGridItem(int index, double height, double width) {
    return Container(
      height: height,
      width: width,
      child: GridItem(
        height: height,
        width: width,
        image: categorylst[index].images,
        isCenter: true,
        productname: categorylst[index].name,
        subname: categorylst[index].subname,
        price: categorylst[index].price,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => InkWell(
            child: _buildDot(index),
            onTap: () {
              _currentPage = index;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommonAppBarScreen(),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            GridView.count(
              shrinkWrap: true,
              childAspectRatio: 0.64,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: _currentItems.map((item) {
                return Container(height: 280,
                  child: _buildGridItem(0, MediaQuery.of(context).size.width * 0.55,
                      MediaQuery.of(context).size.width * 0.178571429),
                );
              }).toList(),
            ),
            
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _currentPage > 0
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _currentPage = _currentPage - 1;
                          });
                        },
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                      )
                    : SizedBox.shrink(),
                SizedBox(width: 5),
                _buildBottomNavigationBar(),
                SizedBox(width: 5),
                Visibility(
                  visible: _currentPage < 4,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _currentPage = _currentPage + 1;
                      });
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 70,
            ),
            ContactDetails(),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final List<String> items;

  NextPage({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Next Page'),
      ),
      body: ListView(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 100,
            crossAxisSpacing: 100,
            children: items.map((item) {
              return Card(
                child: Center(
                  child: Text(item),
                ),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Some Button'),
          ),
        const  SizedBox(height: 20),
        ],
      ),
    );
  }
}
