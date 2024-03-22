import 'package:flutter/material.dart';
import 'package:open_fashion__1/cantroller/home_page_cantroller.dart';
import 'dart:math' as math;

import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/widgets/tab_page.dart';

HomePageCantroller homePageCantroller = HomePageCantroller();

class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key});

  @override
  CustomTabViewState createState() => CustomTabViewState();
}

class CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    _tabController = TabController(
        length: homePageCantroller.categorysModel.value!.cat.length,
        vsync: this);
    _tabController.addListener(_handleTabSelection);

    super.initState();
  }

  void _handleTabSelection() {
    
    if (_tabController.index != _tabController.previousIndex) {
      
      ("Current Tab Index: ${_tabController.index}");
      homePageCantroller.currentTabIndex.value = _tabController.index;
    }
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

          tabs: homePageCantroller.categorysModel.value!.cat
              .map((category) => Tab(text: category.categoryName))
              .toList(),
         
          labelColor: blackColor, 
          unselectedLabelColor: Colors.grey,
          indicator: const CustomTabIndicator(
            color: goldColor,
            angle: 45,
          ),
        ),
      ),
      body: SizedBox(
        height: myheight,
        child: TabBarView(
            controller: _tabController,
            children: homePageCantroller.categorysModel.value!.cat.map((e) {
              return TabPage(list: e.productDetail);
            }).toList()
            //   SizedBox(
            //     child: SingleChildScrollView(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           SizedBox(
            //             height: myheight * 0.05,
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(right: 20),
            //             child: Column(
            //               children: [
            //                 mygrid(
            //                     height: myheight / 4,
            //                     width: mywidth / 2.4,
            //                     image: "assets/images/a.jpg",
            //                     isCenter: false),
            //                 SizedBox(
            //                   height: myheight * 0.02,
            //                 ),
            //                 mygrid(
            //                     height: myheight / 4,
            //                     width: mywidth / 2.4,
            //                     image: "assets/images/c.jpg",
            //                     isCenter: false),
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             height: myheight * 0.05,
            //           ),
            //           Column(
            //             children: [
            //               mygrid(
            //                   height: myheight / 4,
            //                   width: mywidth / 2.4,
            //                   image: "assets/images/b.jpg",
            //                   isCenter: false),
            //               SizedBox(
            //                 height: myheight * 0.02,
            //               ),
            //               mygrid(
            //                   height: myheight / 4,
            //                   width: mywidth / 2.4,
            //                   image: "assets/images/d.jpg",
            //                   isCenter: false),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            //   // const TabPage(),
            //   // const TabPage(),
            //   // const TabPage(),
            //   // const TabPage(),
            ),
      ),
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
