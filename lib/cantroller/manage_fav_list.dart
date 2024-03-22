import 'dart:convert';

import 'package:get/get.dart';
import 'package:open_fashion__1/model/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
//FA8D07
class CartManager extends GetxController {
  // Rx<List<ProductDetail>?> items = Rx<List<ProductDetail>?>(null).obs;
  Rx<List<ProductDetail>?> items = Rx<List<ProductDetail>?>(null);

  List<ProductDetail> items2 = [];

  
  Future<List<ProductDetail>?> getItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? encodedItems = prefs.getStringList('custom_items');
    if (encodedItems != null) {
      items2 = encodedItems
          .map((item) => ProductDetail.fromJson(json.decode(item)))
          .toList();
      if (items2.isNotEmpty) {
        items.value = items2;
        print(items.value!.length);
        return items2;
      }
    }
    return null;
  }

  Future<void> deleteItem(int index) async {
    items.value!.removeAt(index);
    await saveItemsToPrefs(null);
  }

  Future<void> saveItemsToPrefs(ProductDetail? newItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (newItem == null) {
    } else {
      items.value?.add(newItem);
    }
    List<String> encodedItems = [];
    if (items.value == null) {
      encodedItems = [json.encode(newItem)];
    } else {
      encodedItems =
          items.value!.map((item) => json.encode(item.toJson())).toList();
    }
    try {
      prefs.setStringList('custom_items', encodedItems);
    } catch (e) {
      print(e.toString());
    }
   items.value=await  getItems();
  }
}
