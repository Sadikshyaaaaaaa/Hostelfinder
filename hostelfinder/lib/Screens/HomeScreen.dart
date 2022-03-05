import 'package:flutter/material.dart';
import 'package:hostelfinder/Screens/DashboardScreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex = 0;
  // final List _children = [DashboardScreen(), DashboardScreen(), DashboardScreen(), DashboardScreen()];
  //
  // void onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: _children[_currentIndex], // new
  //     bottomNavigationBar: BottomNavigationBar(
  //       onTap: onTabTapped, // new
  //       currentIndex: _currentIndex,
  //       backgroundColor: Colors.white,
  //       // new
  //       items: [
  //         BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.home,
  //               color: Colors.red,
  //             ),
  //             label: ('Home')),
  //         BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.search,
  //               color: Colors.red,
  //             ),
  //             label: ('Search')), BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.map,
  //               color: Colors.red,
  //             ),
  //             label: ('Maps')),
  //
  //         BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.person,
  //               color: Colors.red,
  //             ),
  //             label: ('Home')),
  //
  //       ],
  //       selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  //       selectedItemColor: Colors.blueAccent.shade700,
  //     ),
  //   );
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey.shade400,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.mapMarked,
                  text: 'Maps',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}


