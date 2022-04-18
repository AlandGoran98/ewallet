import 'package:ewallet/constants.dart';
import 'package:ewallet/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);
  static const routeName = "/contactus";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                radius: 20,
                child: ClipOval(
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/aland.jpg',
                    width: 53,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
          backgroundColor: klightBlue),
      body: Container(
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
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: kDarkBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: ListTile(
                  textColor: kWhite,
                  leading: CircleAvatar(
                    radius: 60,
                    child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        'assets/aland.jpg',
                        width: 53,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text('Aland Abdulmajid'),
                  subtitle: Text("Email: aland.goran182@gmail.com"),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: kDarkBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: ListTile(
                  textColor: kWhite,
                  leading: CircleAvatar(
                    radius: 60,
                    child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        'assets/yara.jpg',
                        width: 53,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text('Yara Mohammed'),
                  subtitle: Text("Email: yaramohammedaljanabi@gmail.com"),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: kDarkBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: ListTile(
                  textColor: kWhite,
                  leading: CircleAvatar(
                    radius: 60,
                    child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        'assets/zhikar.jpg',
                        width: 55,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text('Zhikar Jarkis'),
                  subtitle: Text("Email: zhikarjarkes@gmail.com"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
