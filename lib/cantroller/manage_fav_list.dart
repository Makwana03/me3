import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:open_fashion__1/model/product_with_quantity.dart';
import 'package:open_fashion__1/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

//FA8D07
class CartManager extends GetxController {
  // Rx<List<ProductDetail>?> items = Rx<List<ProductDetail>?>(null).obs;
  Rx<List<ProductWithQuantity>?> items = Rx<List<ProductWithQuantity>?>(null);
  List<ProductWithQuantity> items2 = [];

  Future<void> clearList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('custom_items');
    items.value = null;
  }

  Future<List<ProductWithQuantity>?> getItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? encodedItems = prefs.getStringList('custom_items');
    if (encodedItems != null) {
      items2 = encodedItems
          .map((item) => ProductWithQuantity.fromJson(json.decode(item)))
          .toList();
      if (items2.isNotEmpty) {
        items.value = items2;
        return items2;
      }
    }
    return null;
  }

  Future<void> deleteItem(int index, BuildContext context) async {
    items.value!.removeAt(index);
    await saveItemsToPrefs(null, context);
  }

  Future<void> increaseQuantity(int index, BuildContext context) async {
    items.value![index].quantity = items.value![index].quantity + 1;
    await saveItemsToPrefs(null, context);
  }

  Future<void> decreaseQuantity(int index, BuildContext context) async {
    if (items.value![index].quantity > 1) {
      items.value![index].quantity--;

      await saveItemsToPrefs(null, context);
    }
  }

  Future<void> saveItemsToPrefs(
      ProductWithQuantity? newItem, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (newItem == null) {
    } else {
      if (items.value != null) {
        int matchedIndex =
            items.value!.indexWhere((item) {
              print("${item.id} is and  ${newItem.id} ");
              return  item.id == newItem.id;
            });
        bool idExists = matchedIndex != -1;
        if (idExists) {
          increaseQuantity(matchedIndex, context);
          CommonSnackBar.show(context, 'Added to cart');
          matchedIndex = -1;
          // show snackbar for incrise quentity
        } else {
          // show snack bar for add new element
          CommonSnackBar.show(context!, 'Added to cart');

          items.value?.add(newItem);
          matchedIndex = -1;
        }
      } else {
        CommonSnackBar.show(context , 'Added to cart');

        // show snack bar for add new element
        items.value?.add(newItem);
      }
    }

    List<String> encodedItems = [];
    if (items.value == null) {
      encodedItems = [json.encode(newItem)];
    } else {
      encodedItems = items.value!.map((item) {
        return json.encode(item.toJson());
      }).toList();
    }
    try {
      prefs.setStringList('custom_items', encodedItems);
    } catch (e) {
      print(e.toString());
    }
    items.value = await getItems();
  }
}
