// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';

StoreModel storeModelFromJson(String str) => StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
    int status;
    Store store;
    String message;

    StoreModel({
        required this.status,
        required this.store,
        required this.message,
    });

    factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        status: json["status"],
        store: Store.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": store.toJson(),
        "message": message,
    };
}

class Store {
    String email;
    String phone;
    String time;
    String tagLine;
    List<Follow> follow;
    List<ProductDetail> productDetail;

    Store({
        required this.email,
        required this.phone,
        required this.time,
        required this.tagLine,
        required this.follow,
        required this.productDetail,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        email: json["email"],
        phone: json["phone"],
        time: json["time"],
        tagLine: json["tagLine"],
        follow: List<Follow>.from(json["follow"].map((x) => Follow.fromJson(x))),
        productDetail: List<ProductDetail>.from(json["product_detail"].map((x) => ProductDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "time": time,
        "tagLine": tagLine,
        "follow": List<dynamic>.from(follow.map((x) => x.toJson())),
        "product_detail": List<dynamic>.from(productDetail.map((x) => x.toJson())),
    };
}

class Follow {
    int id;
    String image;
    String name;

    Follow({
        required this.id,
        required this.image,
        required this.name,
    });

    factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        id: json["id"],
        image: json["image"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
    };
}

class ProductDetail {
    int id;
    String image;
    String title;

    ProductDetail({
        required this.id,
        required this.image,
        required this.title,
    });

    factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        image: json["image"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
    };
}
