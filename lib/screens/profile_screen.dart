import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/constants.dart';
import 'package:ewallet/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile';
  List dataFromFireStore = [];
  FirebaseFirestore _instance = FirebaseFirestore.instance;
  String? userId = FirebaseAuth.instance.currentUser!.uid;
  getData() async {
    CollectionReference collections =
        FirebaseFirestore.instance.collection("userAccount");
    final document =
        await collections.doc("qIfGcterbkeW9ychFTZsF3abf9o2").get();
    print(collections.toString() + "Collections");
    final data = document.data() as Map<String, dynamic>;
    for (var thisData in data.values) {
      dataFromFireStore.add(thisData);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final _userFireData = Provider.of<Users>(context, listen: false);
    UserId userIdProvider = UserId(userId: userId!);

    final _userFireData = Provider.of<DataBase>(context, listen: false);

    // final UserDataProvider = Provider.of<Users>(context);
    print(FirebaseFirestore.instance
        .collection("userAccount")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots());
    print(dataFromFireStore);
    return StreamBuilder<UserData>(
        stream: DataBase(FirebaseAuth.instance.currentUser!.uid)
            .userDataFromFirebase,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData _LuserSnapshot = snapshot.data!;
            return Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [klightBlue, klightPurpule],
                    tileMode: TileMode.clamp),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                children: [
                  CircleAvatar(
                    radius: 80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: "First Name: " +
                            _LuserSnapshot.firstname.toString(),
                        hintStyle: kRobotoProfile,
                        fillColor: Color(0x25f6feff),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText:
                            "Last Name: " + _LuserSnapshot.lastName.toString(),
                        hintStyle: kRobotoProfile,
                        fillColor: Color(0x25f6feff),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText:
                            "Username: " + _LuserSnapshot.username.toString(),
                        hintStyle: kRobotoProfile,
                        fillColor: Color(0x25f6feff),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: "Email: " + _LuserSnapshot.email.toString(),
                        hintStyle: kRobotoProfile,
                        fillColor: Color(0x25f6feff),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText:
                            "Address: " + _LuserSnapshot.address.toString(),
                        hintStyle: kRobotoProfile,
                        fillColor: Color(0x25f6feff),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText:
                            "Balance: " + _LuserSnapshot.balance.toString(),
                        hintStyle: kRobotoProfile,
                        fillColor: Color(0x25f6feff),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText:
                            "Currency: " + _LuserSnapshot.currency.toString(),
                        hintStyle: kRobotoProfile,
                        fillColor: Color(0x25f6feff),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: _LuserSnapshot.phone.toString(),
                        hintStyle: kRobotoProfile,
                        fillColor: Color(0x25f6feff),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: "National ID: " +
                            _LuserSnapshot.national_id.toString(),
                        hintStyle: kRobotoProfile,
                        fillColor: Color(0x25f6feff),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
