// controller.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:open_fashion__1/allUrl/all_url.dart';
import 'package:open_fashion__1/all_method/http_methodes.dart';
import 'package:open_fashion__1/model/banner_model.dart';
import 'package:open_fashion__1/model/store_information.dart';
import 'package:open_fashion__1/utils/constans.dart';
import 'package:open_fashion__1/view/product_view.dart';
import 'package:open_fashion__1/model/category_model.dart' as s;


class HomePageCantroller extends GetxController {
  var isLoading = false.obs;
  var isLoadingCat = false.obs;
  var isLoadingStore = false.obs;
  RxInt currentTabIndex = 0.obs;
  Rx<BannerModel?> bannerModel = Rx<BannerModel?>(null);
  Rx<s.Categorys?> categorysModel = Rx<s.Categorys?>(null);
  Rx<StoreModel?> storeModel = Rx<StoreModel?>(null);


  void changeLoading(bool loadingStatus) {
    if (isLoading.value) {
     
      isLoading.value = loadingStatus;
    } else {
      isLoading.value = loadingStatus;
    }
  }
   void changeLoadingCat(bool loadingStatus) {
    if (isLoadingCat.value) {
     
      isLoadingCat.value = loadingStatus;
    } else {
      isLoadingCat.value = loadingStatus;
    }
  }
void changeLoadingStore(bool loadingStatus) {
    if (isLoadingStore.value) {
     
      isLoadingStore.value = loadingStatus;
    } else {
      isLoadingStore.value = loadingStatus;
    }
  }
  Future<void> getStoreData(BuildContext context) async {
    try {
      changeLoadingStore(true);
      var response = await getMethode("$baseUrl$store", context, headers);
      if (response.statusCode == 200) {
        changeLoadingStore(false);
        storeModel.value = storeModelFromJson(response.body);
      }
      else{
        print(response.body);
              changeLoadingStore(false);

      }

    } catch (e) {
      print(e.toString());
      changeLoadingStore(false);
    }
  }


  Future<void> getCatData(BuildContext context) async {
    try {
      changeLoadingCat(true);
      var response = await getMethode("$baseUrl$category", context, headers);
      if (response.statusCode == 200) {
        changeLoadingCat(false);
        print(response.body);
        categorysModel.value = s.categorysFromJson(response.body);
                      

        // print(categorysModel.value!.cat[0].categoryName);



      }
      else{
        print(response.body);
              changeLoadingCat(false);

      }

    } catch (e) {
      print(e.toString());
      changeLoadingCat(false);
    }
  }

final Map<String, String> headers = {
      'Content-Type': 'application/json',

    };
  Future<void> getTabData(BuildContext context) async {
    try {
      changeLoading(true);
      print("try");
      var response = await getMethode("$baseUrl$banner", context, headers);
      if (response.statusCode == 200) {
        print(response.body);
         bannerModel.value = bannerModelFromJson(response.body);
              changeLoading(false);


      }
      else{
        print(response.body);
      }

    } catch (e) {
      print(e.toString());
      changeLoading(false);
    }
  }
}



class mygrid extends StatelessWidget {
  const mygrid(
      {super.key,
      required this.height,
      required this.width,
    
      required this.isCenter,
     required this.model,
      });
      
     final s.ProductDetail model;
  final double height;
  
  final double width;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  ProductDetailView(model: model,),
            ));
      },
      child: Column(
        crossAxisAlignment:
             CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(
               model.displayImage,
                fit: BoxFit.fill,
                height: height,
                width: width,
              ),
            ],
          ),
          Container(
            width: width-20,
            child: Center(
              child: Text(
                model.productName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontFamily: 'mp', fontSize: myheight / 77),
              ),
            ),
          ),
          Container(
            width: width -20,
            // alignment: ,
            child: Center(
              child: Text(
                model.productDetail,
                style: TextStyle(fontFamily: 'mp', fontSize: myheight / 77,overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          Text(
            "\$${model.productPrice}",
            style: TextStyle(
                fontFamily: 'mp', color: goldColor, fontSize: myheight / 70),
          )
        ],
      ),
    );
  }
}
