// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
    int status;
    List<Datum> data;
    String message;

    BannerModel({
        required this.status,
        required this.data,
        required this.message,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    int id;
    String image;
    String imageTitle;

    Datum({
        required this.id,
        required this.image,
        required this.imageTitle,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        imageTitle: json["image_title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "image_title": imageTitle,
    };
}
