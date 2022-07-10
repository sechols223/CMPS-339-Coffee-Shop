import 'package:flutter/material.dart';
import 'package:flutter_coffee/screens/sign_in.dart';
import 'package:flutter_coffee/screens/app_drawer.dart';
import 'package:flutter_coffee/screens/products/product_drawer.dart';
import 'package:flutter_coffee/screens/pages/myhomepage.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  //list of widgets to call ontap
  final widgetOptions = [
    new SignInScreen(),
    new MyHomePage(),
    new ProductDrawer(),
    new AppDrawer(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CMPS 339: Coffee Shop')),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload_sharp),
            label: 'Management',
            backgroundColor: Colors.brown,
          ),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
    );
  }
}
