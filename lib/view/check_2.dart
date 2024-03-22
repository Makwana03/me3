import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:open_fashion__1/cantroller/add_address_cantroller.dart';
import 'package:open_fashion__1/cantroller/checkout_cantroller.dart';
import 'package:open_fashion__1/model/add_address_model.dart';
import 'package:open_fashion__1/model/category_model.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/utils/prefrences.dart';
import 'package:open_fashion__1/view/add_adddress_view.dart';
import 'package:open_fashion__1/view/checkout_view.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';
import 'package:open_fashion__1/widgets/commun_dropdown.dart';
import 'package:shared_preferences/shared_preferences.dart';

AddAdressCantroller addAdressCantroller = AddAdressCantroller();
UserAddress? gUserData;
int count = 0;

class Checkout extends StatefulWidget {
  const Checkout({
    super.key,
  });

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedValue = "PICKUP AT STORE";
  String selPaymnt = "COD";
  UserAddress? userAddress;
  bool haveAddress = false;

  Future<void> checkIfValueExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(Preferences.userAdd)) {
      userAddress = userAddressFromJson(prefs.getString(Preferences.userAdd)!);
      gUserData = userAddress == null ? null : userAddress;
    }
    setState(() {});
  }

  @override
  // TODO: implement widget
  Widget addressWidget(UserAddress userAddress2) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${userAddress2.data.firstName} ${userAddress2.data.lastName}",
            style: TextStyle(fontFamily: 'mp'),
          ),
          Text(
            '${userAddress2.data.zipCode}, ${userAddress2.data.address}',
            style: TextStyle(fontFamily: 'mp', overflow: TextOverflow.ellipsis),
          ),
          Text(
            "${userAddress2.data.city} , ${userAddress2.data.state}",
            style: TextStyle(fontFamily: 'mp'),
          ),
          Text(
            userAddress2.data.mobileNumber,
            style: TextStyle(fontFamily: 'mp'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    checkIfValueExists();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(checkoutCantroller.totalPrice.toString());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppBarScreen(count2: count),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              'CHECKOUT',
              style: TextStyle(fontSize: height * 0.03, fontFamily: 'mp'),
              textAlign: TextAlign.center,
            ),
            SvgPicture.asset(
              'assets/svg/5.svg',
              height: height * 0.014,
            ),
            Container(
              alignment: Alignment.topLeft,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SHIPPING ADDRESS',
                      style: TextStyle(color: greyColor, fontFamily: 'mp'),
                    ),
                    gUserData == null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                count += 1;
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddAdress(),
                                ));
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  color: Colors.grey[200],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add Shipping Address',
                                        style: TextStyle(fontFamily: 'mp'),
                                      ),
                                      Spacer(),
                                      Icon(Icons.add),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : addressWidget(gUserData!),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SHIPPING METHOD',
                    style: TextStyle(color: greyColor, fontFamily: 'mp'),
                  ),
                  Commondropdown(
                    Onchange: (value) {
                      setState(() {
                        value = selectedValue;
                      });
                    },
                    items: const ['PICKUP AT STORE', 'DELVIR AT HOME'],
                    value: selectedValue,
                    hint: 'Select Shipping Method',
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const Text(
                    'PAYMENT METHOD',
                    style: TextStyle(color: greyColor, fontFamily: 'mp'),
                  ),
                  Commondropdown(
                    Onchange: (value) {
                      setState(() {
                        value = selPaymnt;
                      });
                    },
                    items: const [
                      'COD',
                    ],
                    value: selPaymnt,
                    hint: 'Select Payment Method',
                  ),
                ],
              ),
            ),
            // Spacer(),
            SizedBox(
              height: height * 0.15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'TOTAL',
                    style: TextStyle(fontFamily: 'mp'),
                  ),
                  Spacer(),
                   Text(
                      '\$${checkoutCantroller.totalPrice.toString()}',
                      style: TextStyle(color: goldColor, fontFamily: 'mp'),
                    ),
                  
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blackColor,
                shape: const ContinuousRectangleBorder(),
              ),
              onPressed: () {
                // hit place order api
                checkoutCantroller.placeOrder(
                    checkoutCantroller.model.value, context);
                ShowDilog();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.06,
                    child: SvgPicture.asset(
                      'assets/svg/s-bag_white.svg',
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  const Text(
                    'PLACE ORDER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whiteColor,
                      fontFamily: 'mp',
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // CheckoutCantroller checkoutCantroller = CheckoutCantroller();
  void ShowDilog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int selectedImage = 0;
        return Obx(
          () => Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'PAYMENT SUCCESS',
                          style: TextStyle(
                            letterSpacing: 2.5,
                            fontFamily: 'mp',
                            fontSize: 23,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SvgPicture.asset('assets/svg/done.svg'),
                        const SizedBox(height: 10),
                        Text(
                          'Your Payment was Success',
                          style: TextStyle(
                            fontFamily: 'mp',
                            fontSize: 19,
                            color: blackColor.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Payment ID 15022044',
                          style: TextStyle(
                            fontFamily: 'mp',
                            fontSize: 16,
                            color: greyColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SvgPicture.asset('assets/svg/3.svg'),
                        const SizedBox(height: 15),
                        Text(
                          'Rate your purchase',
                          style: TextStyle(
                            fontFamily: 'mp',
                            fontSize: 19,
                            color: blackColor.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  print('1');
                                  checkoutCantroller.selectedImage.value = 1;
                                });
                              },
                              child: checkoutCantroller.selectedImage.value == 1
                                  ? SvgPicture.asset('assets/svg/sadBold.svg')
                                  : SvgPicture.asset('assets/svg/sad.svg'),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  checkoutCantroller.selectedImage.value = 2;
                                });
                              },
                              child: checkoutCantroller.selectedImage.value == 2
                                  ? SvgPicture.asset('assets/svg/happyBold.svg')
                                  : SvgPicture.asset(
                                      'assets/svg/happy.svg'),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  checkoutCantroller.selectedImage.value = 3;
                                });
                              },
                              child: checkoutCantroller.selectedImage.value == 3
                                  ? SvgPicture.asset('assets/svg/vHapppBold.svg')
                                  : SvgPicture.asset('assets/svg/vHappy.svg'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blackColor,
                            shape: const BeveledRectangleBorder(),
                          ),
                          onPressed: () {
                            // Handle Submit action
                          },
                          child: const Text(
                            'SUBMIT',
                            style: TextStyle(
                              color: whiteColor,
                              fontFamily: 'mp',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor,
                            shape: const BeveledRectangleBorder(),
                          ),
                          onPressed: () {
                            // Handle Back to Home action
                          },
                          child: const Text(
                            'BACK TO HOME',
                            style: TextStyle(
                              color: blackColor,
                              fontFamily: 'mp',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
