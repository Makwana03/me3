import 'package:flutter/material.dart';
import 'package:open_fashion__1/cantroller/home_page_cantroller.dart';
import 'dart:math' as math;

import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/widgets/tab_page.dart';

void main() {
  runApp(const MaterialApp(
    home: CustomTabView(),
  ));
}

class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key});

  @override
  CustomTabViewState createState() => CustomTabViewState();
}

class CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Tab> myTabs = <Tab>[
    const Tab(text: 'All'),
    const Tab(text: 'Apparel'),
    const Tab(text: 'Dress'),
    const Tab(text: 'Tshirt'),
    const Tab(text: 'Bag'),
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

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: TabBar(
          controller: _tabController,
          labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),

          tabs: myTabs.map((Tab tab) {
            return Tab(
              child: Text(
                tab.text!,
                style: const TextStyle(
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
          indicator: const CustomTabIndicator(
            color: goldColor,
            angle: 45,
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children:  [
        SizedBox(
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
          ),
        ),
        TabPage(),
        TabPage(),
        TabPage(),
        TabPage(),
      ]),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final Color color;
  final double angle;

  const CustomTabIndicator({required this.color, required this.angle});

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
    const double indicatorSize = 5;
    const double indicatorMargin = 8;
    final Rect rect = Offset(
            offset.dx + (configuration.size!.width / 2 - indicatorSize / 2),
            configuration.size!.height - indicatorSize - indicatorMargin) &
        const Size(indicatorSize, indicatorSize);

    final Paint paint = Paint();
    paint.color = decoration.color;
    paint.style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(rect.center.dx, rect.center.dy);
    canvas.rotate(decoration.angle * math.pi / 180);
    canvas.translate(-rect.center.dx, -rect.center.dy);
    canvas.drawRect(rect, paint);
    canvas.restore();
  }
}
