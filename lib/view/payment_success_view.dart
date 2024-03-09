import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion__1/utils/constans.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Full Screen Dialog Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              
            },
            child: Text('Show Full Screen Dialog'),
          ),
        ),
      ),
    );
  }
}
