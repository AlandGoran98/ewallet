import 'package:auto_size_text/auto_size_text.dart';
import 'package:ewallet/constants.dart';
import 'package:ewallet/screens/about_us.dart';
import 'package:ewallet/screens/contact_us.dart';
import 'package:ewallet/screens/home.dart';
import 'package:ewallet/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            child: SizedBox(
              width: size.width,
              height: size.height * 0.1,
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.lightbulb_outline,
                    color: kYellow,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          TextButtonDrawer(
            text: "Home",
            function: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          TextButtonDrawer(
            text: "Report",
            function: () {},
          ),
          TextButtonDrawer(
            text: "History",
            function: () {},
          ),
          TextButtonDrawer(
            text: "About Us",
            function: () {
              Navigator.pushNamed(context, AboutUs.routeName);
            },
          ),
          TextButtonDrawer(
            text: "Contact Us On",
            function: () {
              Navigator.pushNamed(context, ContactUs.routeName);
            },
          ),
          TextButtonDrawer(
            text: "Logout",
            function: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, Login.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class TextButtonDrawer extends StatelessWidget {
  const TextButtonDrawer({Key? key, required this.text, required this.function})
      : super(key: key);
  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: AutoSizeText(
        text,
        style: kRobotoBlackBoldDrawer,
      ),
    );
  }
}
