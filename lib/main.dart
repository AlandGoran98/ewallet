import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/constants.dart';
import 'package:ewallet/model/auth_services.dart';
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
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: LogItems(),
        ),
        // Provider(
        //   create: (context) => AuthenticationServices(FirebaseAuth.instance),
        // ),
        // StreamProvider(
        //     create: (context) =>
        //         Provider.of<AuthenticationServices>(context).authChangeState,
        //     initialData: Login()),

        ChangeNotifierProvider.value(value: ThemeChange()),

        ChangeNotifierProvider<Users>(
          create: (context) => Users(),
        ),

        // ChangeNotifierProvider.value(value: UserId()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-wallet',
        theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: klightBlue,
              onPrimary: Colors.black,
              secondary: kYellow,
              onSecondary: klightBlue,
              error: Colors.red,
              onError: kYellow,
              background: klightBlue,
              onBackground: klightPurpule,
              surface: klightBlue,
              onSurface: klightPurpule),
          primarySwatch: Colors.blue,
        ),
        home: Login(),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          Login.routeName: (context) => Login(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          ChartStatistics.routeName: (context) => ChartStatistics(),
          Verfications.routeName: (context) => Verfications(),
        },
      ),
    );
  }
}
