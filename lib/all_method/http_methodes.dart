import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> checkInternetStatus() async {
  try {
    final result = await InternetAddress.lookup('example.com')
        .timeout(const Duration(seconds: 10));
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  } catch (e) {
    return false;
  }
  return false;
}

Future<http.Response> postMethod(String url, Map<String, dynamic> body,
    Map<String, String> header, BuildContext context) async {
  try {
    if (await checkInternetStatus() == false) {
      // print("Check ");
      if (context.mounted) {
        // commonSnackBar(
        //     context: context,
        //     msg: 'check your internet connection and try again');
      }
      throw ("Check Your Connection");
    } else {
      var response =
          await http.post(Uri.parse(url), headers: header, body: jsonEncode(body));
      return response;
    }
  } catch (e) {
    rethrow;
  }
}

Future<http.Response> getMethode(
    String url, BuildContext context, Map<String, String> head) async {
  try {
    // if (await checkInternetStatus() == false) {
    //   if (context.mounted) {

    //     // commonSnackBar(
    //     //     context: context,
    //     //     msg: 'Check Your Internet Connection And Try Again');
    //   }
    //   // print('object');
    //   // const CommonAlertDialog(
    //   //   message: "Pleaseeee",
    //   // );
    //   // throw ("check");
    // }
    var response = await http.get(Uri.parse(url), headers: head);
    return response;
  } catch (e) {
    throw ("Something Went Wrong ${e.toString()}");
  }
}
