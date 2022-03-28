import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/constants.dart';
import 'package:ewallet/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile';
  FirebaseFirestore _instance = FirebaseFirestore.instance;
  String? userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _userFireData = Provider.of<Users>(context, listen: false);
    UserId userIdProvider = UserId(userId: userId!);
    final UserDataProvider = Provider.of<Users>(context);
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
      child: StreamBuilder<UserData>(
          stream: DataBase(userIdProvider.userIdGetter.toString())
              .userDataFromFirebase,
          builder: (context, snapshot) {
            Users UserDataProvider = Provider.of<Users>(context, listen: false);
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                itemCount: UserDataProvider.userListData.length,
                itemBuilder: (context, i) {
                  return TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: 'zh',
                        hintStyle: TextStyle(
                          letterSpacing: 2,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        fillColor: Colors.white30,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none)),
                  );
                },

                // Row(
                //   children: [
                //     Expanded(
                //       child: CircleAvatar(
                //         radius: 60,
                //       ),
                //     ),
                //     Expanded(
                //       child: TextField(
                //         enabled: false,
                //         decoration: InputDecoration(
                //             hintText: 'zh',
                //             hintStyle: TextStyle(
                //               letterSpacing: 2,
                //               color: Colors.black54,
                //               fontWeight: FontWeight.bold,
                //             ),
                //             fillColor: Colors.white30,
                //             filled: true,
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(10.0),
                //                 borderSide: BorderSide.none)),
                //       ),
                //     ),
                //   ],
                // ),

                // ],
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
