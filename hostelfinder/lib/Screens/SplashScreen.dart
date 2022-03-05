import 'package:flutter/material.dart';
import 'package:hostelfinder/Screens/Admin/AdminDashboard.dart';
import 'package:hostelfinder/Screens/UserAuthentication/LoginScreen.dart';
import 'package:hostelfinder/Screens/UserAuthentication/RegisterScreen.dart';
import 'package:splashscreen/splashscreen.dart';

import 'HomeScreen.dart';
class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Builder(
            builder: (context) {
              return Center(
                  child:
                  SplashScreen(
                      seconds: 3,
                      navigateAfterSeconds: LoginScreen(),
                      image: Image.asset("assets/images/logo.png",
                          height: 400, width: 400, fit: BoxFit.contain),
                      backgroundColor: Colors.white,
                      styleTextUnderTheLoader: new TextStyle(),
                      photoSize: 100.0,
                      loaderColor: Colors.blueAccent.shade700
                  )
              );
            }
        ));
  }
}
