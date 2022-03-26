import 'package:ewallet/constants.dart';
import 'package:ewallet/model/auth_services.dart';
import 'package:ewallet/provider/theme_provider.dart';
import 'package:ewallet/screens/home.dart';
import 'package:ewallet/screens/verification.dart';
import 'package:ewallet/widgets/login_widget.dart';
import 'package:ewallet/widgets/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLogin = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // final TextEditingController _passwordController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  AuthenticationServices _authService =
      AuthenticationServices(FirebaseAuth.instance);
  @override
  void initState() {
    _form;

    super.initState();
  }

  @override
  void dispose() {
    _phoneFocusNode;
    _phoneController;
    super.dispose();
  }

  // Future signInEmailPassword(String email, String password) async {
  //   try {
  //     // if (_user != null) {

  //     // }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future? user;
  Future verifications() async {
    try {
      // verifications();
      // _form.currentState!.save();
      // final _user =

      await _auth.signInWithEmailAndPassword(
          email: _emailController.value.text,
          password: _passwordController.value.text);
      await _authService.signInWithPhoneNumber(_phoneController.value.text);

      //  user = _user;
      Navigator.pushReplacementNamed(
        context,
        Verfications.routeName,
      );
    } catch (e) {
      setState(() {
        _isLogin = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: klightPurpule,
          content: Row(
            children: [
              Icon(Icons.delete),
              Text(
                e.toString(),
                style: kRobotoMedium,
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeChange theme = Provider.of<ThemeChange>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              theme.changeTheme();
            },
            color: Colors.yellow,
          ),
          backgroundColor: klightBlue),
      body: _isLogin
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: theme.isLight
                          ? [kYellow, klightBlue]
                          : [klightBlue, klightPurpule],
                      tileMode: TileMode.clamp),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'LOGIN',
                              style: kRobotoWhiteLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Phone Number",
                                  style: kRoboto,
                                ),
                              ),
                              TextFormField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  hintStyle: kRobotoTextField,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      (value.trim().length == 0)) {
                                    return "Please Enter Your Phone Number";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Email",
                                  style: kRoboto,
                                ),
                              ),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Email",
                                  hintStyle: kRobotoTextField,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                validator: (value) {
                                  if (value == null && !value!.contains("@")) {
                                    return "Please Enter valid email Adreess";
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Password",
                                  style: kRoboto,
                                ),
                              ),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: kRobotoTextField,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                validator: (value) {
                                  if (value == null && (value!.length < 8)) {
                                    return "Please Enter valid Password more than 8 characters";
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: kRoboto,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            var isValid = _form.currentState!.validate();
                            if (!isValid) {
                              return;
                            }
                            setState(() {
                              _isLogin = true;
                            });
                            verifications();
                          },
                          child: Text(
                            "LOGIN",
                            style: kRoboto,
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: kYellow,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45.0, vertical: 10.0)),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text("don't have an account?", style: kRoboto),
                        //     TextButton(
                        //         onPressed: () {
                        //           Navigator.push(context,
                        //               MaterialPageRoute(builder: (context) => SignUP()));
                        //         },
                        //         child: Text("Sign Up"))
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
