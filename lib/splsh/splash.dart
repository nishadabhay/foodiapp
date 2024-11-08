import 'package:flutter/material.dart';
import 'package:foodies/GetStartedScreen/getstartedpages.dart';

class Mysplash extends StatefulWidget {
  const Mysplash({super.key});

  @override
  State<Mysplash> createState() => _MysplashState();
}

class _MysplashState extends State<Mysplash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/spl.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => Getstartedpages()));
                    },
                    child: Center(
                        child: Text(
                      "Get Started",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
