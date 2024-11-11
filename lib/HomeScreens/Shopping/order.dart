import 'package:flutter/material.dart';

import '../home_page.dart';

class Myorders extends StatelessWidget {
  const Myorders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
                    "Orders",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
        ),

      ),
      body: Center(
        child: Container(

          child: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/order.png")),
                SizedBox(height: 10,),
                Text(
                    "No Orders yet",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                Text(" Hit the orange button down\n   below to create an order",style: TextStyle(fontSize: 17,color: Colors.black26),),
                SizedBox(height: 80,),SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomepage()));
                    },
                    child: Center(
                        child: Text(
                          "Start Ordering",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
