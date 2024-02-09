import 'package:flutter/material.dart';
import 'package:open__fashion/utils/constans.dart';
import 'package:open__fashion/widgets/common_app_bar.dart';
import 'package:open__fashion/widgets/common_textfiled.dart';
import 'package:open__fashion/widgets/grid_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileController = TextEditingController();
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: CommonAppBarScreen()),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridItem(),
            SizedBox(
              width: 200,
              child: CommonTextFormField(
                controller: mobileController,
                label: 'Mobile Number',
                errorMessage: 'Please enter valid Number',
                inputType: TextInputType.number,
                formatter: [mobileLengthFormatter, mobileNumberFormater],
                length: 10,
                onTap: () {},
                isMobileNumber: false,
                isReadOnly: false,
              ),
            )
          ],
        ));
  }
}
