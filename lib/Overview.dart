import 'package:flutter/material.dart';
import 'package:recipeapp/Screens/profile_screen.dart';
import 'package:recipeapp/Screens/search_screen.dart';
import 'package:recipeapp/Screens/upload_screen.dart';
import 'Screens/bookmark_screen.dart';
import 'Screens/home_screen.dart';

class Overview extends StatefulWidget {

  Overview({Key key}) : super(key: key);
  static String id = 'overview_screen';

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {

  PageController _pageController = PageController();
  List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    UploadScreen(),
    BookmarkScreen(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_point),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange[300],
      ),
    );
  }
}
