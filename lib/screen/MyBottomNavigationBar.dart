import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Booking.dart';
import 'Loginscreen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}



class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _currentIndex = 0 ;
  final List<Widget> _children = [

    MyHomePage(),
    Booking(),
    LoginScreen(),
    Booking(),
    Booking(),
  ];

  void onTappedBar (int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            // ignore: deprecated_member_use
            title:Text('Home'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.airport_shuttle),
            // ignore: deprecated_member_use
            title:Text('Booking'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.account_circle),
            // ignore: deprecated_member_use
            title:Text('Account'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.settings),
            // ignore: deprecated_member_use
            title:Text('Settings'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue[900],
      ),

    );
  }
}