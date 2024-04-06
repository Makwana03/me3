
  import 'package:flutter/material.dart';

  class CommonSnackBar {
    static void show(BuildContext context, String message) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide any existing SnackBar

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            behavior: SnackBarBehavior.floating,
            // padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            duration: Duration(seconds: 3), // You can set the duration
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Adjust the radius as needed
            ),

            // Set close icon color
            backgroundColor: Colors.brown,
            elevation: 30, //djust the duration as needed
          ),
        );
    }
  }
