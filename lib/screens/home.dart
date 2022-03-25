import 'package:auto_size_text/auto_size_text.dart';
import 'package:ewallet/constants.dart';
import 'package:ewallet/screens/chart_screen.dart';
import 'package:ewallet/screens/home_screen.dart';
import 'package:ewallet/screens/profile_screen.dart';
import 'package:ewallet/widgets/credit_card.dart';
import 'package:ewallet/widgets/drawer.dart';
import 'package:ewallet/widgets/home_prop_cards.dart';
import 'package:ewallet/widgets/monthly_log.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final time = DateTime.now();
  List _listPage = [];
  int _currentIndex = 0;
  Widget? _currentPage;
  @override
  void initState() {
    _listPage
      ..add(HomeScreen())
      ..add(ChartStatistics())
      ..add(ProfileScreen());
    _currentPage = HomeScreen();
    // getCurrentPage(currentIndex);
    super.initState();
  }

  void getCurrentPage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPage[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: const CircleAvatar(
                radius: 20,
              ),
            )
          ],
          backgroundColor: klightBlue),
      body: _currentPage,
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: klightBlue,
                ),
                label: "home",
                activeIcon: Icon(
                  Icons.home_filled,
                  color: klightBlue,
                )),
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.notifications_active_outlined,
            //       color: klightBlue,
            //     ),
            //     label: "Notifications",
            //     activeIcon: Icon(
            //       Icons.notifications_active,
            //       color: klightBlue,
            //     )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insert_chart_outlined,
                  color: klightBlue,
                ),
                label: "Statistics",
                activeIcon: Icon(
                  Icons.insert_chart,
                  color: klightBlue,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insert_chart_outlined,
                  color: klightBlue,
                ),
                label: "Statistics",
                activeIcon: Icon(
                  Icons.insert_chart,
                  color: klightBlue,
                )),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.account_circle_outlined,
            //     color: klightBlue,
            //   ),
            //   label: "Profile",
            //   activeIcon: Icon(
            //     Icons.account_circle,
            //     color: klightBlue,
            //   ),
            // ),
          ],
          onTap: (value) => getCurrentPage(value),
        ),
      ),
    );
  }
}
