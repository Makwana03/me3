import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:open_fashion__1/allUrl/all_url.dart';
import 'package:open_fashion__1/all_method/http_methodes.dart';
import 'package:open_fashion__1/model/category_model.dart';
import 'package:open_fashion__1/view/check_2.dart';

class CheckoutCantroller extends GetxController {
  RxInt totalPrice=  0.obs;
  RxInt selectedImage=  0.obs;
  RxList<ProductDetail>model =[ ProductDetail(
      id: 1,
      displayImage: '',
      productName: '',
      productDetail: '',
      productPrice: 0,
      productDiscount: 0,
      categoryId: 0,
      productImages: [])].obs;
  Rx<int> quentity = 0.obs;
  void setValues(int totalPrice2 , var list) {
    totalPrice.value = totalPrice2;
    model.value = list;
  }

  Future<void> placeOrder(List<ProductDetail> products,int totalPrice, BuildContext context) async {
    List<Map<String , dynamic>> allProduct =[];
    Map<String, int> product = {
      "productID": 1,
      "quantity": 2,
      "total_product_price": 120
    };
    for (var element in products) {
      allProduct.add({
      "productID": element.id,
      "quantity": 1,
      "total_product_price": element.productPrice
    });
    }
    
    Map<String, dynamic> body = {
      "products": allProduct,
      "shipping_method": "Pick Up At Store",
      "payment_method": "cash on delivery",
      "total_price": 240
    };
    Map<String, String> hader = {
      'Content-Type': 'application/json',
      "Authorization": gUserData!.token
    };
    try {
      print(allProduct.toString());
      var response = await postMethod('$baseUrl$order', body, hader, context);
      if (response.statusCode == 200) {
        print("Order Success full");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
