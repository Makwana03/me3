import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_fashion__1/allUrl/all_url.dart';
import 'package:open_fashion__1/all_method/http_methodes.dart';
import 'package:open_fashion__1/model/add_address_model.dart';
import 'package:open_fashion__1/utils/prefrences.dart';
import 'package:open_fashion__1/utils/shared_helper.dart';
import 'package:open_fashion__1/view/check_2.dart';
import 'package:open_fashion__1/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAdressCantroller extends GetxController {
  Rx<UserAddress?> userAddress = Rx<UserAddress?>(null);
  var isLoading = false.obs;

  void changeLoading(bool loadingStatus) {
    if (isLoading.value) {
      isLoading.value = loadingStatus;
    } else {
      isLoading.value = loadingStatus;
    }
  }

  Future<void> addadressData(
    BuildContext context,
    String firstName,
    String lastName,
    String city,
    String state,
    String mobileNumber,
    String address,
    String zipCode,
  ) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> body = {
      "firstName": firstName,
      "lastName": lastName,
      "city": city,
      "state": state,
      "mobileNumber": mobileNumber,
      "address": address,
      "zip_code": zipCode
    };

    try {
      changeLoading(true);
      var response =
          await postMethod("$baseUrl$addAdress", body, headers, context);

      if (response.statusCode == 200) {
        changeLoading(false);
        userAddress.value = userAddressFromJson(response.body);
        var sharedPreferences = await SharedPreferences.getInstance();
        SharedPreferencesHelper sharedPreferencesHelper =
            SharedPreferencesHelper(sharedPreferences);
        sharedPreferencesHelper.putString(Preferences.userAdd, response.body);
        print(userAddress.value.toString());
        print(userAddress.value!.data);
        count += 1;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Checkout(),
        ));
      } else {
        var encodeBody = jsonDecode(response.body);
        print(encodeBody['message']);
        CommonSnackBar.show(context, encodeBody['message']);
        changeLoading(false);
      }
    } catch (e) {
      print(e.toString());
      changeLoading(false);
    }
  }
}
