import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'news_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  Widget screenCheck() {
    if (_currentIndex == 1) {
      return NewsScreen();
    } else {
      return homeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5855BD),
        title: Center(
          child: Text(
            'NEWS',
            style: TextStyle(color: Color(0xFFffffff), letterSpacing: 4.5),
          ),
        ),
      ),
      body: screenCheck(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height / 10,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          elevation: 10,
          backgroundColor: Color(0xFF5855BD),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.40),
          selectedFontSize: MediaQuery.of(context).size.height / 60,
          unselectedFontSize: MediaQuery.of(context).size.height / 60,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('News'),
              icon: Icon(Icons.library_books),
            ),
            BottomNavigationBarItem(
              title: Text('Settings'),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
