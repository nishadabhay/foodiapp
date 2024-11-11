import 'package:flutter/material.dart';
import 'package:foodies/HomeScreens/Drawer/profile.dart';
import 'package:foodies/HomeScreens/Shopping/order.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("HomePage")),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Myorders()));
                },
                icon: Icon(Icons.shopping_cart)),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.heart_broken_sharp),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: "Home"),
          ]),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              child: Text("Email value"),
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Myprofile()));
              },
            ),
            ListTile(
              title: Text("Setting"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Myprofile()));
              },
            ),
            ListTile(),
            ListTile(),
            ListTile(),
            ListTile(),
            ListTile(
              title: Text("LogOut"),
              leading: Icon(Icons.logout),
            )
          ],
        ),
      ),
      body: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delicius\nfood for you",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              SearchBar(
                hintText: "Search here",
              )
            ],
          ),
        ),
      ),
    );
  }
}
