import 'package:ewallet/constants.dart';
import 'package:ewallet/provider/user_provider.dart';
import 'package:ewallet/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class Verfications extends StatefulWidget {
  const Verfications({Key? key}) : super(key: key);
  static const routeName = '/verifications';

  @override
  State<Verfications> createState() => _VerficationsState();
}

class _VerficationsState extends State<Verfications> {
  final controller = TextEditingController();

  final focusNode = FocusNode();
  final _auth = FirebaseAuth.instance;
  final time = DateTime.now();
  String? userId;

  List<UserData> userDataList = [];
  List _listPage = [];
  int _currentIndex = 0;
  Widget? _currentPage;
  Future currentUsers() async {
    User? _user = _auth.currentUser;
    // print(_user!.uid);
    String _useruid = _user!.uid;
    userId = _useruid;
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromARGB(255, 242, 245, 247);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Color.fromARGB(255, 250, 251, 252),
      ),
      decoration: BoxDecoration(),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              length: 6,
              pinAnimationType: PinAnimationType.slide,
              controller: controller,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              showCursor: true,
              cursor: cursor,
              preFilledWidget: preFilledWidget,
              onSubmitted: (pin) async {
                // final user = await FirebaseAuth.instance.currentUser!.uid;
                Navigator.pushReplacementNamed(
                  context,
                  HomePage.routeName,
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: kYellow),
              onPressed: () {
                currentUsers();
                UserId userIdProvider = UserId(userId: userId.toString());

                print("${userIdProvider.userId}  this one");
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
