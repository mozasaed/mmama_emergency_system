import 'package:flutter/material.dart';

import 'DocDashboard.dart';
import 'ProfileScreen.dart';
import 'Setting.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedIndex = 0;

  final  pages = [
    const DocDashboard(),
    const DocDashboard(),
    const ProfileScreen(),
    const Settings(),
    // const Subscription(),
    // const TafutaMagazeti(),
    // const Settings(),
  ];
  final PageController _pageController = PageController();



  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // initialPage: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Colors.blue),
        items: const [
          BottomNavigationBarItem(

            label: "Home",
            icon: Icon(Icons.home,color: Colors.blue,),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search_rounded,color: Colors.blue),
          ),
          BottomNavigationBarItem(
            label: "Add Profile",
            icon: Icon(Icons.add,color: Colors.blue),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings,color: Colors.blue),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

      ),
    );

  }
}
