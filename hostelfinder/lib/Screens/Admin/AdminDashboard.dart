
import 'package:flutter/material.dart';

import 'AddHostel.dart';



class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("Welcome Admin",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/images/admin.png",
                    height: 50, width: 50, fit: BoxFit.contain),
              ),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 200,
                height: 100,
                child: ElevatedButton.icon(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddHostel()));
                }, icon:  const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  label: const Text("Add Doctor",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )),),
              ),
              const SizedBox(
                height: 30,
              ),

              SizedBox(
                width: 200,
                height: 100,
                child: ElevatedButton.icon(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddHostel()));
                }, icon:  const Icon(
                  Icons.book_outlined,
                  color: Colors.white,
                ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(
                      Colors.amber,
                    ),
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  label: const Text("Doctor Info",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
