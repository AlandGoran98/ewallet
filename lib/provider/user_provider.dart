import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserId with ChangeNotifier {
  final String userId;
  String get userIdGetter {
    return userId;
  }

  notifyListeners();
  UserId({required this.userId});
}

class DataBase {
  final String userId;

  DataBase(this.userId);

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      userId: userId,
      username: snapshot["username"],
      email: snapshot['email'],
      national_id: snapshot['national_id'],
      phone: snapshot['phone'],
      accountCreationTime: snapshot['created_time'],
      pincode: snapshot['pincode'],
      password: snapshot['pass'],
      firstname: snapshot['fname'],
      lastName: snapshot['lname'],
      address: snapshot['address'],
      balance: snapshot['balance'],
      currency: snapshot['currency'],
      Location: snapshot['location'],
    );
  }

  Stream<UserData> get userDataFromFirebase {
    return FirebaseFirestore.instance
        .collection("userAccount")
        .doc(userId)
        .snapshots()
        .map(_userDataFromSnapshot);
    ;
  }
}

class UserData {
  String? userId;
  Timestamp? accountCreationTime;
  String? pincode;
  String? password;
  String? firstname;
  String? lastName;
  String? address;
  int? balance;
  // final DateTime birthDate;
  String? email;
  GeoPoint? Location;
  String? currency;
  String? phone;
  int? national_id;
  String? username;
  double? lang;
  double? lat;
  UserData({
    this.lang,
    this.lat,
    this.userId,
    this.username,
    this.email,
    this.national_id,
    this.phone,
    this.accountCreationTime,
    this.pincode,
    this.password,
    this.firstname,
    this.lastName,
    this.address,
    this.balance,
    this.currency,
    // required this.birthDate,
    this.Location,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json["userId"],
      username: json["username"],
      email: json['email'],
      national_id: json['national_id'],
      phone: json['phone'],
      accountCreationTime: json['created_time'],
      pincode: json['pincode'],
      password: json['pass'],
      firstname: json['fname'],
      lastName: json['lname'],
      address: json['address'],
      balance: json['balance'],
      currency: json['currency'],
      Location: json['location'],
    );
  }
}

class Users with ChangeNotifier {
  Map<String, UserData> _users = {};
  List<UserData> _userListData = [];
  List<UserData> get userListData {
    return _userListData;
  }

  Map<String, UserData> get users {
    return {..._users};
  }

  FirebaseFirestore? _instance;

  Future<void> getUserData(
    User? userId,
  ) async {
    CollectionReference collections =
        await _instance!.collection("userAccount");
    final document = await collections.doc(userId.toString()).get();
    var data = document.data() as Map;
    var user_data = data[userId] as List<dynamic>;
    user_data.forEach((fireData) {
      _userListData.add(UserData.fromJson(fireData));
    });
    notifyListeners();
  }
}
 // DateTime? accountCreationTime,
    // String? pincode,
    // String? phone,
    // String? username,
    // String? firstname,
    // String? lastName,
    // String? address,
    // String? email,
    // double? balance,
    // String? password,
    // int? national_id,
    // String? Location,
    // String? currency,
    // ======================
 // var userData = {
    //   "fname": firstname,
    //   "lname": lastName,
    //   "email": email,
    //   "pass": password,
    //   "phone": phone,
    //   "created_time": accountCreationTime,
    //   "currency": currency,
    //   "national_id": national_id,
    //   "pincode": pincode,
    //   "username": username,
    //   "address": address,
    //   "balance": balance,
    // };
    // UserData user_data = UserData(
    //     userId: userId!,
    //     username: username!,
    //     email: email!,
    //     national_id: national_id!,
    //     phone: phone!,
    //     accountCreationTime: accountCreationTime!,
    //     pincode: pincode!,
    //     password: password!,
    //     firstname: firstname!,
    //     lastName: lastName!,
    //     address: address!,
    //     balance: balance!,
    //     currency: currency!,
    //     Location: Location!);
