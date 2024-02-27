import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_fashion__1/cantroller/home_page_cantroller.dart';
import 'dart:math'as math;

import 'package:open_fashion__1/utils/constans.dart';

void main() {
  runApp(MaterialApp(
    home: CustomTabView(),
  ));
}

class CustomTabView extends StatefulWidget {
  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
 late TabController _tabController;
  List<Tab> myTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Apparel'),
    Tab(text: 'Dress'),
    Tab(text: 'Tshirt'),
    Tab(text: 'Bag'),
  ];
  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
// Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: myheight * 0.05,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 20),
//                   child: Column(
//                     children: [
//                       mygrid(
//                           height: myheight / 4,
//                           width: mywidth / 2.4,
//                           image: "assets/images/a.jpg",
//                           isCenter: false),
//                       SizedBox(
//                         height: myheight * 0.02,
//                       ),
//                       mygrid(
//                           height: myheight / 4,
//                           width: mywidth / 2.4,
//                           image: "assets/images/c.jpg",
//                           isCenter: false),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: myheight * 0.05,
//                 ),
//                 Column(
//                   children: [
//                     mygrid(
//                         height: myheight / 4,
//                         width: mywidth / 2.4,
//                         image: "assets/images/b.jpg",
//                         isCenter: false),
//                     SizedBox(
//                       height: myheight * 0.02,
//                     ),
//                     mygrid(
//                         height: myheight / 4,
//                         width: mywidth / 2.4,
//                         image: "assets/images/d.jpg",
//                         isCenter: false),
//                   ],
//                 ),
//               ],
//             ),
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: 
        
         PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: TabBar(
            controller: _tabController,
                labelPadding: EdgeInsets.symmetric(horizontal: 5.0), // Adjust padding between tab titles
          
            tabs: myTabs.map((Tab tab) {
              return Tab(
                child: Text(
          tab.text!,
          style: TextStyle(
            fontSize: 14, // Adjust font size as needed
            fontFamily: 'mp',
            fontWeight: FontWeight.bold, // Adjust font weight as needed
            fontStyle: FontStyle.italic, // Adjust font style as needed
            // You can add more text style properties here as needed
          ),
                ),
              );
            }).toList(),
             labelColor: blackColor, // Color of the selected tab title
            unselectedLabelColor: Colors.grey,
            indicator: CustomTabIndicator(
            color: goldColor,
              angle: 45, // Rotate indicator by 45 degrees// Adjust border radius
            ),
          ),
        
      ),
      body: TabBarView(
        controller: _tabController,
        children:[
           SizedBox(child: Row(
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
                          image: "assets/images/a.jpg",
                          isCenter: false),
                      SizedBox(
                        height: myheight * 0.02,
                      ),
                      mygrid(
                          height: myheight / 4,
                          width: mywidth / 2.4,
                          image: "assets/images/c.jpg",
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
                        image: "assets/images/b.jpg",
                        isCenter: false),
                    SizedBox(
                      height: myheight * 0.02,
                    ),
                    mygrid(
                        height: myheight / 4,
                        width: mywidth / 2.4,
                        image: "assets/images/d.jpg",
                        isCenter: false),
                  ],
                ),
              ],
            ),),
    
    // Second Tab View
    Center(child: Text('Tab 5')),

    // Third Tab View
    Center(child: Text('Tab 3')),

    // Fourth Tab View
    Center(child: Text('Tab 4')),

    // Fifth Tab View
    Center(child: Text('Tab 5')),
        ]
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final Color color;
  final double angle;

  CustomTabIndicator({required this.color, required this.angle});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double indicatorSize = 5; // Size of the indicator
    final double indicatorMargin = 8; // Margin around the indicator
    final Rect rect = Offset(
            offset.dx +
                (configuration.size!.width / 2 -
                    indicatorSize / 2), // Center horizontally
            configuration.size!.height -
                indicatorSize -
                indicatorMargin) & // Align with the bottom
        Size(indicatorSize, indicatorSize);

    final Paint paint = Paint();
    paint.color = decoration.color;
    paint.style = PaintingStyle.fill;

    canvas.save(); // Save canvas state before transformation
    canvas.translate(rect.center.dx, rect.center.dy); // Move to center of the indicator
    canvas.rotate(decoration.angle * math.pi / 180); // Rotate canvas
    canvas.translate(-rect.center.dx, -rect.center.dy); // Move back to original position
    canvas.drawRect(rect, paint); // Draw rotated indicator
    canvas.restore(); // Restore canvas state
  }
}
