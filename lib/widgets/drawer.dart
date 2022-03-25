import 'package:auto_size_text/auto_size_text.dart';
import 'package:ewallet/constants.dart';
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
            text: "Profile",
            function: () {},
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
            function: () {},
          ),
          TextButtonDrawer(
            text: "Contact Us On",
            function: () {},
          ),
          TextButtonDrawer(
            text: "Profile",
            function: () {},
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
