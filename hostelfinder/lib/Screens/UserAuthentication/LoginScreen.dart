import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../ApiServices/userServices.dart';
import '../Admin/AdminDashboard.dart';
import '../HomeScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email = "";
  String password = "";

  bool isSeen = true;

  loginData() async {
    try {
      var body = {
        "email": email,
        "password": password,
      };
      var userservice=await userServices();
      var response = await userservice.login(body);
      return response;


    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(

              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Image.asset("assets/images/logo.png",
                          height: 100, width: 150, fit: BoxFit.fill),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.blueAccent.shade700,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              Icon(
                                Icons.email,
                                color: Colors.blueAccent.shade700,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Email Address",
                                    style: TextStyle(
                                        color: Colors.blueAccent.shade700,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            controller: emailController,
                            onChanged: (value) {
                              email = value;
                            },

                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 10.0, right: 5, top: 30, bottom: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent.shade700, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent.shade700, width: 1))),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.lock,
                                color: Colors.blueAccent.shade700,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Password",
                                    style: TextStyle(
                                        color: Colors.blueAccent.shade700,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),

                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: passwordController,
                            obscureText: isSeen,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10.0, right: 5, top: 30, bottom: 10),
                              suffixIcon: IconButton(
                                icon: Icon(isSeen
                                    ? Icons.visibility
                                    : Icons.visibility_off, color: Colors.blueAccent.shade700,),
                                onPressed: () {
                                  setState(() {
                                    isSeen = !isSeen;
                                  });
                                },
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700, width: 1)),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if(email=="admin@gmail.com" && password=="admin"){
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AdminDashboard()));

                                  }else{
                                    var response = await loginData();
                                    var res = json.decode(response);
                                    // userid=res["userId"];

                                    if (res["success"] == true) {
                                      Fluttertoast.showToast(
                                          msg: 'Login Successful',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.black);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()));
                                    }
                                    if(res["success"]==false){
                                      Fluttertoast.showToast(
                                          msg: 'Invalid Login',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white);

                                    }
                                  }

                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                    Colors.blueAccent.shade700,
                                  ),

                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),

                                      )
                                  ),
                                ),
                                child: const Text("Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Text("Create an account?",
                            style: TextStyle(color: Colors.black)),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()),
                          ),
                          child: const Text("Register here",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Image.asset("assets/images/login.jpg",
                          height: 230, width: 350, fit: BoxFit.fill),
                    ),
                  ],
                ),
              )),
        ));
  }
}
