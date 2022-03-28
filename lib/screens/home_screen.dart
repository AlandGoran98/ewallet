import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/constants.dart';
import 'package:ewallet/provider/user_provider.dart';
import 'package:ewallet/widgets/credit_card.dart';
import 'package:ewallet/widgets/home_prop_cards.dart';
import 'package:ewallet/widgets/monthly_log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // final _auth = FirebaseAuth.instance;

  // User? userId;

  // Future currentUsers() async {
  //   User? _user = _auth.currentUser;
  //   print(_user!.uid);
  //   String _useruid = _user.uid;
  //   _useruid = userId.toString();
  // }

  String? _balance;
  String? _username;
  HomeScreen({Key? key}) : super(key: key);
  FirebaseFirestore _instance = FirebaseFirestore.instance;
  String? userId = FirebaseAuth.instance.currentUser!.uid;
  // User? _user = FirebaseAuth.instance.currentUser;
  final time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Users _userFireData = Provider.of<Users>(context, listen: false);
    UserId userIdProvider = UserId(userId: userId!);
    return StreamBuilder<UserData>(
        stream: DataBase(userIdProvider.userIdGetter).userDataFromFirebase,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? snap = snapshot.data;
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
                children: [
                  CreditCard(
                    balance: _balance ?? snap!.balance!.toString(),
                    text: _username ?? snap!.username!.toString(),
                  ),
                  Row(
                    children: [
                      HomeCards(icon: Icons.import_contacts),
                      HomeCards(icon: Icons.compare_arrows),
                      HomeCards(icon: Icons.add_circle_outline),
                      HomeCards(icon: Icons.shopping_basket),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.2725,
                    child: Card(
                      color: Colors.white,
                      child: ListView(
                        padding: EdgeInsets.all(10.0),
                        children: [
                          AutoSizeText("This Month", style: kRobotoBlackBold),
                          MonthlyLog(
                              subtitleText: time.toString(),
                              titleText: 'WithdrawPay',
                              paymentNumber: "\$1500"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
