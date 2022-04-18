import 'package:ewallet/constants.dart';
import 'package:ewallet/provider/log_provider.dart';
import 'package:ewallet/provider/theme_provider.dart';
import 'package:ewallet/provider/user_provider.dart';
import 'package:ewallet/screens/chart_screen.dart';
import 'package:ewallet/screens/home.dart';
import 'package:ewallet/screens/login.dart';
import 'package:ewallet/screens/profile_screen.dart';
import 'package:ewallet/screens/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static const routeName = '/myapp';
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/72874-user-profile-v2.json',
          controller: _controller,
          height: 400,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(
                () =>
                    Navigator.pushReplacementNamed(context, HomePage.routeName),
              );
          },
        ),
      ),
    );
  }
}
