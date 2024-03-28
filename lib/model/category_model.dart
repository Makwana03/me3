// To parse this JSON data, do
//
//     final categorys = categorysFromJson(jsonString);

import 'dart:convert';

Categorys categorysFromJson(String str) => Categorys.fromJson(json.decode(str));

String categorysToJson(Categorys data) => json.encode(data.toJson());

class Categorys {
    int status;
    List<Category> cat;
    String message;

    Categorys({
        required this.status,
        required this.cat,
        required this.message,
    });

    factory Categorys.fromJson(Map<String, dynamic> json) => Categorys(
        status: json["status"],
        cat: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(cat.map((x) => x.toJson())),
        "message": message,
    };
}

class Category {
    String categoryName;
    int categoryId;
    List<ProductDetail> productDetail;

    Category({
        required this.categoryName,
        required this.categoryId,
        required this.productDetail,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"],
        categoryId: json["categoryID"],
        productDetail: List<ProductDetail>.from(json["product_detail"].map((x) => ProductDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "categoryID": categoryId,
        "product_detail": List<dynamic>.from(productDetail.map((x) => x.toJson())),
    };
}

class ProductDetail {
    int? id;
    String displayImage;
    String productName;
    String productDetail;
    int productPrice;
    int productDiscount;
    int categoryId;
    List<ProductImage> productImages;

    ProductDetail({
        required this.id,
        required this.displayImage,
        required this.productName,
        required this.productDetail,
        required this.productPrice,
        required this.productDiscount,
        required this.categoryId,
        required this.productImages,
    });

    factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        displayImage: json["display_image"],
        productName: json["product_name"],
        productDetail: json["product_detail"],
        productPrice: json["product_price"],
        productDiscount: json["product_discount"],
        categoryId: json["categoryID"],
        productImages: List<ProductImage>.from(json["product_images"].map((x) => ProductImage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "display_image": displayImage,
        "product_name": productName,
        "product_detail": productDetail,
        "product_price": productPrice,
        "product_discount": productDiscount,
        "categoryID": categoryId,
        "product_images": List<dynamic>.from(productImages.map((x) => x.toJson())),
    };
}

class ProductImage {
    int id;
    String productImage;
    int productId;

    ProductImage({
        required this.id,
        required this.productImage,
        required this.productId,
    });

    factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        productImage: json["product_image"],
        productId: json["productID"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_image": productImage,
        "productID": productId,
    };
}












class Clothcategories {
  final String images;
  final String name;
  final String subname;
  final String price;

  Clothcategories({required this.images, required this.name, required this.subname, required this.price});
}

