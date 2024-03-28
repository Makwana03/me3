import 'package:open_fashion__1/model/category_model.dart';

class ProductWithQuantity {
    int id;
    String displayImage;
    String productName;
    String productDetail;
    int productPrice;
    int productDiscount;
    int categoryId;
    List<ProductImage> productImages;
    int quantity; // New field for quantity

    ProductWithQuantity({
        required this.id,
        required this.displayImage,
        required this.productName,
        required this.productDetail,
        required this.productPrice,
        required this.productDiscount,
        required this.categoryId,
        required this.productImages,
        required this.quantity,
    });

    factory ProductWithQuantity.fromJson(Map<String, dynamic> json) => ProductWithQuantity(
        id: json["id"],
        displayImage: json["display_image"],
        productName: json["product_name"],
        productDetail: json["product_detail"],
        productPrice: json["product_price"],
        productDiscount: json["product_discount"],
        categoryId: json["categoryID"],
        productImages: List<ProductImage>.from(json["product_images"].map((x) => ProductImage.fromJson(x))),
        quantity: json['quantity'], // Initialize quantity to 0
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
        "quantity": quantity,
    };
}
