// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print, file_names, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion__1/cantroller/add_address_cantroller.dart';

import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/widgets/common_app_bar.dart';
import 'package:open_fashion__1/widgets/common_textfiled.dart';

AddAdressCantroller addAdressCantroller = AddAdressCantroller();

class AddAdress extends StatefulWidget {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  const AddAdress({super.key});

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _addressCantoler = TextEditingController();
  final TextEditingController _cityCantroller = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _stateControlle = TextEditingController();
  final TextEditingController _zipeCodeControlle = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

// @override
//   void initState()async {
//     // SHaredP
//     super.initState();
//   }
  @override
  Widget build(BuildContext context) {
    double height = getScreenHeight(context);
    double width = getScreenWidth(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CommonAppBarScreen(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: AddAdress._key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "ADD SHIPING ADRESS",
                    style: TextStyle(
                        fontFamily: 'mp', letterSpacing: 2, fontSize: 22),
                  ),
                  // const SizedBox(height: 5,),
                  SvgPicture.asset('assets/svg/3.svg'),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2 - 15),
                        child: CommonTextFormField(
                          controller: _firstNameController,
                          label: 'First Name',
                          errorMessage: 'Enter Your First Name',
                          inputType: TextInputType.text,
                          formatter: [],
                          length: 60,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2 - 15),
                        child: CommonTextFormField(
                          controller: _lastNameController,
                          label: 'Last Name',
                          errorMessage: 'Enter Your Last Name',
                          inputType: TextInputType.text,
                          formatter: [],
                          length: 60,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFormField(
                    controller: _addressCantoler,
                    label: 'Adress',
                    errorMessage: 'Please enter valid Adress',
                    inputType: TextInputType.text,
                    formatter: [],
                    length: 60,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFormField(
                    controller: _cityCantroller,
                    label: 'City',
                    errorMessage: 'Please enter your City name',
                    inputType: TextInputType.text,
                    formatter: [],
                    length: 60,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2 - 15),
                        child: CommonTextFormField(
                          controller: _stateControlle,
                          label: 'State',
                          errorMessage: 'Enter Your State Name',
                          inputType: TextInputType.text,
                          formatter: [],
                          length: 60,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2 - 15),
                        child: CommonTextFormField(
                          controller: _zipeCodeControlle,
                          label: 'ZIP Code',
                          errorMessage: 'Enter ZIP Code',
                          inputType: TextInputType.number,
                          formatter: [zipCodeLengthFormatter],
                          length: 60,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFormField(
                    controller: _mobileController,
                    label: 'Phone Number',
                    errorMessage: 'Please enter valid Number',
                    inputType: TextInputType.number,
                    formatter: [mobileLengthFormatter, mobileNumberFormat],
                    length: 10,
                    onTap: () {},
                    isMobileNumber: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: height * 0.06,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: const BeveledRectangleBorder()),
          onPressed: () {
            if (AddAdress._key.currentState!.validate()) {
              addAdressCantroller.addadressData(
                  context,
                  _firstNameController.text,
                  _lastNameController.text,
                  _cityCantroller.text,
                  _stateControlle.text,
                  _mobileController.text,
                  _addressCantoler.text,
                  _zipeCodeControlle.text);
            }
          },
          child: const Text(
            'ADD NOW',
            style: TextStyle(color: Colors.white, fontFamily: 'mp'),
          ),
        ),
      ),
    );
  }
}
