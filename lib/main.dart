import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/constants.dart';
import 'package:ewallet/get_main_data.dart';
import 'package:ewallet/model/auth_services.dart';
import 'package:ewallet/provider/auth.dart';
import 'package:ewallet/provider/cart.dart';
import 'package:ewallet/provider/log_provider.dart';
import 'package:ewallet/provider/orders.dart';
import 'package:ewallet/provider/product_provider.dart';
import 'package:ewallet/provider/theme_provider.dart';
import 'package:ewallet/provider/user_provider.dart';
import 'package:ewallet/screens/about_us.dart';
import 'package:ewallet/screens/cart_screen.dart';
import 'package:ewallet/screens/chart_screen.dart';
import 'package:ewallet/screens/contact_us.dart';
import 'package:ewallet/screens/edit_product_screen.dart';
import 'package:ewallet/screens/home.dart';
import 'package:ewallet/screens/home_screen_add.dart';
import 'package:ewallet/screens/login.dart';
import 'package:ewallet/screens/orders_scren.dart';
import 'package:ewallet/screens/product_detail_screen.dart';
import 'package:ewallet/screens/product_detail_screen.dart';
import 'package:ewallet/screens/profile_screen.dart';
import 'package:ewallet/screens/user_products_screen.dart';
import 'package:ewallet/screens/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: LogItems(),
        ),

        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products('', '', []),
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (context) => Orders('', '', []),
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            auth.userId,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
        ChangeNotifierProvider.value(value: ThemeChange()),

        ChangeNotifierProvider<DataBase>(
          create: (context) => DataBase(FirebaseAuth.instance.currentUser!.uid),
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
        routes: {
          HomePage.routeName: (context) => HomePage(),
          Login.routeName: (context) => Login(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          ChartStatistics.routeName: (context) => ChartStatistics(),
          Verfications.routeName: (context) => Verfications(),
          MyApp.routeName: (context) => MyApp(),
          HomePageShop.routeName: (context) => HomePageShop(),
          ProductDetailScreen.productDetail: (context) => ProductDetailScreen(),
          CartScreen.cartScreen: (context) => CartScreen(),
          OrdersScren.routeName: (context) => OrdersScren(),
          UserProductsScreen.routeName: (context) => UserProductsScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
          ContactUs.routeName: (context) => ContactUs(),
          AboutUs.routeName: (context) => AboutUs(),
        },
        home: SplashScreen(),
      ),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
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
          'assets/37464-repayment-concept-e-wallet-payment-inprogress.json',
          controller: _controller,
          height: 400,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(
                () => Navigator.pushReplacementNamed(context, Login.routeName),
              );
          },
        ),
      ),
    );
  }
}
