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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.heart_broken_sharp), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          ]),
      drawer: Drawer(
        backgroundColor: Colors.deepOrange,
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
      body: DefaultTabController(
        length: 4, // Number of tabs
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delicious\nfood for you",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                SearchBar(
                  hintText: "Search here",
                ),
                SizedBox(height: 20),
                // Horizontal TabBar
                TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey.withOpacity(0.3),
                  indicatorColor: Colors.deepOrange,
                  labelColor: Colors.deepOrange,
                  tabs: [
                    Tab(child: Text('Food')),
                    Tab(child: Text('Drinks')),
                    Tab(child: Text('Snacks')),
                    Tab(child: Text('Chinese')),
                  ],
                ),
                SizedBox(height: 80,),
                Expanded(

                  child: TabBarView(

                    children: [
                      // Food Tab
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CustomCard(title: 'Pizza', description: 'Delicious cheese pizza', imageUrl: 'https://via.placeholder.com/150'),
                          SizedBox(width: 10),
                          CustomCard(title: 'Burger', description: 'Juicy beef burger', imageUrl: 'https://via.placeholder.com/150'),
                          SizedBox(width: 10),
                          CustomCard(title: 'Pasta', description: 'Creamy pasta with herbs', imageUrl: 'https://via.placeholder.com/150'),
                          SizedBox(width: 10),
                          CustomCard(title: 'Pasta', description: 'Creamy pasta with herbs', imageUrl: 'https://via.placeholder.com/150'),
                        ],
                      ),
                      // Drinks Tab
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CustomCard(title: 'Coke', description: 'Refreshing cola drink', imageUrl: 'https://via.placeholder.com/150'),
                          SizedBox(width: 10),
                          CustomCard(title: 'Juice', description: 'Fresh orange juice', imageUrl: 'https://via.placeholder.com/150'),
                          SizedBox(width: 10),
                          CustomCard(title: 'Water', description: 'Pure mineral water', imageUrl: 'https://via.placeholder.com/150'),
                        ],
                      ),
                      // Snacks Tab
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CustomCard(title: 'Chips', description: 'Crunchy potato chips', imageUrl: 'https://via.placeholder.com/150'),
                          SizedBox(width: 10),
                          CustomCard(title: 'Cookies', description: 'Chocolate chip cookies', imageUrl: 'https://via.placeholder.com/150'),
                          SizedBox(width: 10),
                          CustomCard(title: 'Nuts', description: 'Mixed nuts for snacking', imageUrl: 'https://via.placeholder.com/150'),
                        ],
                      ),
                      // Chinese Tab
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CustomCard(title: 'Noodles', description: 'Stir-fried noodles', imageUrl: 'https://via.placeholder.com/150'),
                          SizedBox(width: 10),
                          CustomCard(title: 'Dumplings', description: 'Steamed dumplings', imageUrl: 'https://via.placeholder.com/150'),
                          SizedBox(width: 10),
                          CustomCard(title: 'Fried Rice', description: 'Delicious fried rice', imageUrl: 'https://via.placeholder.com/150'),
                        ],
                      ),
                    ],
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
// CustomCard -------------------------------------------------------------
class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Set your desired width
      height: 180, // Set your desired height
      child: Card(
        child: Column(
          children: [
            ClipOval(
              child: Image.network(
                imageUrl,
                width: 150, // Adjust the width of the circular image
                height: 150, // Adjust the height of the circular image
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}