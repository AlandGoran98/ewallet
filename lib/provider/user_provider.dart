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

class DataBase with ChangeNotifier {
  final String userId;

  DataBase(this.userId);

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      // userId: userId,
      username: snapshot["username"],
      email: snapshot['email'],
      national_id: snapshot['national_id'],
      phone: snapshot['phone'],
      created_time: snapshot['created_time'],
      pincode: snapshot['pincode'],
      password: snapshot['pass'],
      firstname: snapshot['fname'],
      lastName: snapshot['lname'],
      address: snapshot['address'],
      balance: snapshot['balance'],
      currency: snapshot['currency'],
      // Location: snapshot['location'],
    );
  }

  Stream<UserData> get userDataFromFirebase {
    return FirebaseFirestore.instance
        .collection("userAccount")
        .doc(userId)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  List _userDataFire = [];
  List get userDataFire {
    return _userDataFire;
  }

  addData() {
    _userDataFire.add(userDataFromFirebase);
    print(_userDataFire);
    notifyListeners();
  }
}

class UserData {
  List<UserData> _userListData = [];
  List<UserData> get userListData {
    return _userListData;
  }

  // String? userId;
  Timestamp? created_time;
  String? pincode;
  String? password;
  String? firstname;
  String? lastName;
  String? address;
  String? balance;
  // final DateTime birthDate;
  String? email;
  // GeoPoint? Location;
  String? currency;
  String? phone;
  String? national_id;
  String? username;
  // double? lang;
  // double? lat;
  UserData({
    // this.lang,
    // this.lat,
    // this.userId,
    this.username,
    this.email,
    this.national_id,
    this.phone,
    this.created_time,
    this.pincode,
    this.password,
    this.firstname,
    this.lastName,
    this.address,
    this.balance,
    this.currency,
    // required this.birthDate,
    // this.Location,
  });
  UserData.FromFirestore(QueryDocumentSnapshot<Object?> json) {
    UserData(
      username: json["username"],
      email: json['email'],
      national_id: json['national_id'],
      phone: json['phone'],
      created_time: json['created_time'],
      pincode: json['pincode'],
      password: json['pass'],
      firstname: json['fname'],
      lastName: json['lname'],
      address: json['address'],
      balance: json['balance'],
      currency: json['currency'],
    );
  }
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      // userId: json["userId"],
      username: json["username"],
      email: json['email'],
      national_id: json['national_id'],
      phone: json['phone'],
      created_time: json['created_time'],
      pincode: json['pincode'],
      password: json['pass'],
      firstname: json['fname'],
      lastName: json['lname'],
      address: json['address'],
      balance: json['balance'],
      currency: json['currency'],
      // Location: json['location'],
    );
  }
  UserData.fromMap(Map<String, dynamic> mapData) {
    username = mapData["username"];
    email = mapData['email'];

    national_id = mapData['national_id'];
    phone = mapData['phone'];
    created_time = mapData['created_time'];
    pincode = mapData['pincode'];

    password = mapData['pass'];

    firstname = mapData['fname'];

    lastName = mapData['lname'];

    address = mapData['address'];

    balance = mapData['balance'];

    currency = mapData['currency'];

    // Location = mapData['location'];
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

  Future<dynamic> getUserData(
    String? userId,
  ) async {
    try {
      UserId? id;

      CollectionReference collections =
          FirebaseFirestore.instance.collection("userAccount");
      final document = await collections.snapshots().listen((snapshot) {
        _userListData = [];
        snapshot.docs.forEach((json) {
          // _userListData.add(DataBase.user)
        });
      });

      // print(collections.toString() + "Collections");
      // final data = document.data() as Map<String, dynamic>;
      // for (var thisData in data.values) {
      //   // _userListData.add(thisData);
      // }

      // print(data.toString() + "data");

      // print(_userListData);
      print("${userListData} LISTTTT");
      print("${_userListData} haaaa");
      notifyListeners();
    } catch (e) {
      print(e.toString() + "ERRRRROOOORRR");
    }
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
