import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:open_fashion__1/all_method/http_methodes.dart';
import 'package:open_fashion__1/cantroller/checkout_cantroller.dart';
import 'package:open_fashion__1/cantroller/manage_fav_list.dart';
import 'package:open_fashion__1/model/category_model.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/view/check_2.dart';
import 'package:open_fashion__1/view/product_view.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';

CheckoutCantroller checkoutCantroller = CheckoutCantroller();

class first extends StatefulWidget {
  const first({
    super.key,
  });

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  late double itemPrice;

  @override
  void initState() {
    // quantities = List<int>.filled(
    //     cartManager.items.value == null ? 0 : cartManager.items.value!.length,
    //     1);
    
    super.initState();
  }

  double calculateTotal() {
    double total = 0.0;
    if (cartManager.items.value == null) {
      return 0;
    }
    for (int i = 0; i < cartManager.items.value!.length; i++) {
      total += cartManager.items.value![i].productPrice *cartManager.items.value![i].quantity;
    }
    return total;
  }

  void increaseQuantity(int index) {
    setState(() {
      cartManager.increaseQuantity(index ,context);
    });
  }

  void decreaseQuantity(int index) {
    if (cartManager.items.value![index].quantity > 1) {
      setState(() {
        cartManager.decreaseQuantity(index,context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    double totalPrice = calculateTotal();
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(myheight * 0.076530612),
          child: CommonAppBarScreen(
            isCart: true,
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(myheight * 0.012755102),
            child: cartManager.items.value == null
                ? Center(child:  Image.asset('assets/images/download.jpeg'),)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: myheight * 0.012755102,
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
                      SvgPicture.asset(
                        'assets/svg/3.svg',
                        width: 0.204081 * myheight,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: myheight * 0.5520204082,
                        child: ListView.builder(
                          itemCount: cartManager.items.value!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: greyColor,
                                    height: 150,
                                    width: 110,
                                    child: Image.network(
                                      cartManager
                                          .items.value![index].displayImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          cartManager
                                              .items.value![index].productName,
                                          style: const TextStyle(
                                              letterSpacing: 2,
                                              fontFamily: 'mp',
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: 0.555555556 *
                                            getScreenWidth(context),
                                        child: Text(
                                          cartManager.items.value![index]
                                              .productDetail,
                                          softWrap:
                                              true, // Allow text to wrap onto multiple lines
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 12, fontFamily: 'mp'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              decreaseQuantity(index);
                                            },
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(50)),
                                                border: Border.all(
                                                    color: greyColor
                                                        .withOpacity(0.4)),
                                              ),
                                              child: SvgPicture.asset(
                                                  "assets/svg/plus.svg"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          
                                           Obx(()=>
                                              Text(
                                                '${cartManager.items.value?[index].quantity}',
                                                style: const TextStyle(
                                                    fontSize: 18, fontFamily: 'mp'),
                                              ),
                                           ),
                                          
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              increaseQuantity(index);
                                            },
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(50)),
                                                border: Border.all(
                                                    color: greyColor
                                                        .withOpacity(0.4)),
                                              ),
                                              child: SvgPicture.asset(
                                                  "assets/svg/plus2.svg"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              '\$${cartManager.items.value![index].productPrice}',
                                              style:const TextStyle(
                                                  fontSize: 19,
                                                  color: goldColor,
                                                  fontFamily: 'mp'),
                                            ),
                                            Spacer(),
                                            InkWell(
                                                onTap: () {
                                                  // Delete item from list
                                                  setState(() {
                                                    cartManager
                                                        .deleteItem(index ,context);
                                                    totalPrice =
                                                        calculateTotal();

                                                    // quantities.removeAt(index);
                                                  });
                                                },
                                                child: Icon(Icons.delete))
                                            // IconButton(
                                            //     onPressed: () {
                                            //       // Delete item from list
                                            //       setState(() {
                                            //         cartManager.deleteItem(index);
                                            //         totalPrice = calculateTotal();

                                            //         quantities.removeAt(index);
                                            //       });
                                            //     },
                                            //     icon: Icon(Icons.delete))
                                          ],
                                        ),
                                      ),
                                    const  SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(),

                      // const SizedBox(
                      //   height: 20,
                      //   child: Divider(
                      //     thickness: 1.5,
                      //   ),
                      // ),
                      // Row(
                      //   children: [
                      //     const SizedBox(
                      //       width: 25,
                      //     ),
                      //     SvgPicture.asset('assets/svg/cupon.svg'),
                      //     const SizedBox(
                      //       width: 15,
                      //     ),
                      //     const Text(
                      //       "Add promo code",
                      //       style: TextStyle(fontFamily: 'mp'),
                      //     )
                      //   ],
                      // ),
                       SizedBox(
                        height: 0.031887755 * myheight,
                        child: Divider(
                          thickness: 1.5,
                        ),
                      ),
                      Row(
                        children: [
                           SizedBox(
                            height: 0.031887755 * myheight,
                          ),
                          SvgPicture.asset('assets/svg/door.svg'),
                           SizedBox(
                            width: 0.019132653 * myheight,
                          ),
                          const Text(
                            "Delivery",
                            style: TextStyle(fontFamily: 'mp'),
                          ),
                          const Spacer(),
                          const Text(
                            "Free",
                            style: TextStyle(fontFamily: 'mp'),
                          ),
                           SizedBox(
                            width: 0.044642857 * myheight,
                          )
                        ],
                      ),
                       SizedBox(
                        height: 0.019132653 * myheight,
                        child: Divider(
                          thickness: 1.5,
                        ),
                      ),
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
                              '\$$totalPrice',
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'mp',
                                  fontWeight: FontWeight.w500,
                                  color: goldColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
          ),
        ),
        bottomNavigationBar: SizedBox(
            height: myheight * 0.07,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: BeveledRectangleBorder()),
                onPressed: () {
                  checkoutCantroller.setValues(
                      totalPrice ~/ 1, cartManager.items.value!);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Checkout(),
                      ));
                },
                child: Row(
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
                      width: mywidth * 0.05,
                    ),
                    const Text(
                      'CHECKOUT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: whiteColor, fontFamily: 'mp', fontSize: 20),
                    ),
                  ],
                ))),
      ),
    );
  }
}
