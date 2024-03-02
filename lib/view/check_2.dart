import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';
import 'package:open_fashion__1/widgets/commun_dropdown.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedValue = "PICKUP AT STORE";
  String selPaymnt = "COD";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:const PreferredSize(
          preferredSize: Size.fromHeight(50), child: CommonAppBarScreen()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              'CHECKOUT',
              style: TextStyle(fontSize: height * 0.03),
              textAlign: TextAlign.center,
            ),
            SvgPicture.asset(
              'assets/svg/5.svg',
              height: height * 0.014,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                color: whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SHIPPING ADDRESS',
                        style: TextStyle(color: greyColor,fontFamily: 'mp'),
                      ),
                    const  Padding(padding: EdgeInsets.only(left: 8)
                      ,child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                        'Iris Watson',
                        style: TextStyle(fontFamily: 'mp'),
                      ),
                      Text(
                        '606-3727, Ullamcorper, Street',
                        style: TextStyle(fontFamily: 'mp'),
                      ),
                      Text('Roseville NH 11523 ',style: TextStyle(fontFamily: 'mp'),),
                      Text('(786) 713-8616',style: TextStyle(fontFamily: 'mp'),),
                        ],
                      ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: height * 0.05,
                            //width: width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius:
                                const    BorderRadius.all(Radius.circular(50)),
                                color: Colors.grey[200]),
                            // color: Colors.grey[200],
                            child:const Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('Add Shipping Address',style: TextStyle(fontFamily: 'mp'),),
                                  Spacer(),
                                  Icon(Icons.add)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const    Text(
                  'SHIPPING METHOD',
                  style: TextStyle(color: greyColor,fontFamily: 'mp'),
                ),
                Commondropdown(
                  Onchange: (value) {
                    setState(() {
                      value = selectedValue;
                    });
                  },
                  items:const ['PICKUP AT STORE', 'DELIVER', 'STORE'],
                  value: selectedValue,
                  hint: 'Select Shipping Method',
                  // label: 'Pickup at store',
                ),
                SizedBox(
                  height: height * 0.05,
                ),
            const    Text(
                  'PAYMENT METHOD',
                  style: TextStyle(color: greyColor,fontFamily: 'mp'),
                ),
                Commondropdown(
                  Onchange: (value) {
                    setState(() {
                      value = selPaymnt;
                    });
                  },
                  items: const ['COD', 'UPI', 'Card'],
                  value: selPaymnt, hint: 'Select Payment Method',
        
                  // label: 'Select PAYMENT METHOD',
                ),
                
            
              ]),
            ),
            // Spacer(),
            SizedBox(height: height * 0.15,),
const   Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('TOTAL',style: TextStyle(fontFamily: 'mp'),),
                  Spacer(),
                  Text(
                    '\$240',
                    style: TextStyle(color: redColor,fontFamily: 'mp'),
                  )
                ],
              ),
            ),         
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
          style: ElevatedButton.styleFrom(

              backgroundColor: blackColor, shape: ContinuousRectangleBorder()),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                
                height: height * 0.06,
                width: width * 0.06,
                child: SvgPicture.asset(
                  'assets/svg/s-bag_white.svg',
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
            const  Text(
                'PLACE ORDER',
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor,fontFamily: 'mp',fontSize: 17),
              ),
            ],
          )),
    );
  }
}
