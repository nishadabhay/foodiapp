import 'package:flutter/material.dart';
import 'package:foodies/LoginScreens/loginpage.dart';
import 'package:foodies/RegisterScreens/registerpage.dart';

class Getstartedpages extends StatefulWidget {
  const Getstartedpages({super.key});

  @override
  State<Getstartedpages> createState() => _GetstartedpagesState();
}

class _GetstartedpagesState extends State<Getstartedpages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/logod.png"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Mylogin()));
                  },
                  child: Center(
                      child: Text(
                        "Login here!",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "OR",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Myregisterpage()));
                  },
                  child: Center(
                      child: Text(
                    "Register here!",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
