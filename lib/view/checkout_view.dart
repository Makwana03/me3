import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/view/check_2.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';

class first extends StatefulWidget {
  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  int quantity = 1;
  double itemPrice = 120;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
          appBar:const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CommonAppBarScreen(),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'CHECKOUT',
                      style: TextStyle(
                        fontSize: myheight * 0.03,
                        letterSpacing: 4,
                        fontFamily: 'mp',
                      ),
                    ),
                  ),
                  // SizedBox(width: 20),

                  SvgPicture.asset(
                    'assets/svg/3.svg',
                    width: 160,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: greyColor,
                        height: 150,
                        width: 110,
                        child: Image.asset(
                          'assets/images/c.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "LAMEREI",
                            style: TextStyle(
                                letterSpacing: 3,
                                fontFamily: 'mp',
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        const  Text(
                            "Recycle Boucle Knit Cardigan Pink",
                            style: TextStyle(fontSize: 12, fontFamily: 'mp'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.,
                            children: [
                              InkWell(
                                onTap: () {
                                  decreaseQuantity();
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    border: Border.all(
                                        color: greyColor.withOpacity(0.4)),
                                    // color: greyColor
                                  ),
                                  child:
                                      SvgPicture.asset("assets/svg/plus.svg"),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                '$quantity',
                                style:
                                  const  TextStyle(fontSize: 18, fontFamily: 'mp'),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              InkWell(
                                onTap: () {
                                  increaseQuantity();
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                       const BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: greyColor.withOpacity(0.4)),
                                    // color: greyColor
                                  ),
                                  child:
                                      SvgPicture.asset("assets/svg/plus2.svg"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '\$120',
                            style: TextStyle(fontSize: 19, color: goldColor,fontFamily: 'mp'),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
               const  SizedBox(
                    height: 20,
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  Row(
                    children: [
                    const  SizedBox(width: 25,),
                      SvgPicture.asset('assets/svg/cupon.svg'),
                   const   SizedBox(width: 15,),
                   const   Text("Add promo code",style: TextStyle(fontFamily: 'mp'),)
                    ],
                  ),
                const  SizedBox(
                    height: 25,
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  
                  Row(
                    children: [
                    const  SizedBox(width: 25,),
                      SvgPicture.asset('assets/svg/door.svg'),
                    const  SizedBox(width: 15,),
                    const  Text("Delivery",style: TextStyle(fontFamily: 'mp'),),

                   const   Spacer(),
                   const   Text("Free",style: TextStyle(fontFamily: 'mp'),),
                   const   SizedBox(width: 35,)
                    ],
                  ),
                const SizedBox(
                    height: 20,
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                const  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'EST. TOTAL',
                          style: TextStyle(
                            fontFamily: 'mp',
                            fontSize: 17,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${(quantity * itemPrice).toStringAsFixed(0)}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontFamily: 'mp',
                              fontWeight: FontWeight.w500,
                              color: goldColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
              height: myheight * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape:const BeveledRectangleBorder()),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Checkout(),
                      ));
                },
                child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                
                height: myheight * 0.06,
                width: mywidth * 0.06,
                child: SvgPicture.asset(
                  'assets/svg/s-bag_white.svg',
                ),
              ),
              SizedBox(
                width:mywidth * 0.05,
              ),
            const  Text(
                'CHECKOUT',
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor,fontFamily: 'mp',fontSize: 17),
              ),
            ],
          )
              ))),
    );
  }
}
