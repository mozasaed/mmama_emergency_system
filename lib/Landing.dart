import 'package:flutter/material.dart';
import 'package:mmama/Contacts.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0;
  final  pages = [
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Contacts(),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text(' Street Emergency'),
        backgroundColor: Colors.blueAccent
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 990,
        width: 940,
        child:Center(
          child: FloatingActionButton(
            onPressed: () {
            },
            elevation: 1.0,
            shape: CircleBorder(side: BorderSide(color: Colors.blueGrey.withOpacity(0.25),width: 10.0)),
            child: const Icon(Icons.notification_important_sharp),

          ),
        ),
      ),

      body:const Center(child: Text('Press Request Help Button!')),

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
