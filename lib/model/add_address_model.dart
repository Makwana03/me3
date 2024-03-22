// To parse this JSON data, do
//
//     final userAddress = userAddressFromJson(jsonString);

import 'dart:convert';

UserAddress userAddressFromJson(String str) => UserAddress.fromJson(json.decode(str));

String userAddressToJson(UserAddress data) => json.encode(data.toJson());

class UserAddress {
    int status;
    Data data;
    String token;
    String message;

    UserAddress({
        required this.status,
        required this.data,
        required this.token,
        required this.message,
    });

    factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "token": token,
        "message": message,
    };
}

class Data {
    int userId;
    String firstName;
    String lastName;
    String address;
    String city;
    String state;
    String zipCode;
    String mobileNumber;

    Data({
        required this.userId,
        required this.firstName,
        required this.lastName,
        required this.address,
        required this.city,
        required this.state,
        required this.zipCode,
        required this.mobileNumber,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userID"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        mobileNumber: json["mobileNumber"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "mobileNumber": mobileNumber,
    };
}
