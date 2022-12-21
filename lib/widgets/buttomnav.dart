import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/kesan_pesan.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key, required String title}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    KesanPesan(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("UAS MOBILE MENYENANGKAN",
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 30),
        selectedItemColor: Colors.deepPurple,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.deepOrangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Kesan & Pesan',
            backgroundColor: Colors.blueAccent,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
