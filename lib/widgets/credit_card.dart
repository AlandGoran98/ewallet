import 'package:auto_size_text/auto_size_text.dart';
import 'package:ewallet/constants.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({Key? key, required this.text, required this.balance})
      : super(key: key);
  final String balance;
  final String? text;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.30,
      child: Card(
        color: klightPurpule.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.001,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CreditText1(text: "Current balance"),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 35.0,
                      ),
                      child: Icon(Icons.account_balance),
                    ),
                  ],
                ),
                CreditText2(text: balance),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreditText1(text: "${text}"),
                Row(
                  children: [
                    CreditText2(text: "5282 " + "3456 " + "7890 " + "1289"),
                    CreditText2(text: "09/25"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CreditText2 extends StatelessWidget {
  const CreditText2({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: AutoSizeText(
        text,
        style: kRoboto,
      ),
    );
  }
}

class CreditText1 extends StatelessWidget {
  const CreditText1({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: AutoSizeText(
        text,
        style: kRobotoMedium,
      ),
    );
  }
}
