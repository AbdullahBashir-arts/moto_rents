import 'package:flutter/material.dart';
import 'package:motorents/bikecompanies.dart';
import 'package:motorents/profilescreen.dart';

class BikeMainPage extends StatefulWidget {
  @override
  _BikeMainPageState createState() => _BikeMainPageState();
}

class _BikeMainPageState extends State<BikeMainPage> {
  int _selectedIndex = 0;

  // Placeholder pages for bottom navigation
  final List<Widget> _pages = [
    Center(child: Text('Home Page')),   // Placeholder for Home
    Center(child: Text('BikeCompanies')), // Placeholder for Bike Companies
    Center(child: Text('Profile Page')),  // Placeholder for Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the current index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        leading: Icon(Icons.menu, color: Colors.white,),
        title: Text(
          'MotoRents',
          style: TextStyle(
              fontFamily: 'Alkatra',
              fontSize: 29,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/MyImage.jpg'),
              ),
            )
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          child: Image.asset(
                            'assets/CompaniesLogo/hondalogo.png',
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                        Card(
                          child: Image.asset(
                            'assets/CompaniesLogo/superpowerlogo.png',
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                        Card(
                          child: Image.asset(
                            'assets/CompaniesLogo/suzukilogo(2).png',
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                        Card(
                          child: Image.asset(
                            'assets/CompaniesLogo/unitedlogo.png',
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                        Card(
                          child: Image.asset(
                            'assets/CompaniesLogo/yamahalogo.png',
                            height: 112,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          _onItemTapped(index);
        },
        backgroundColor: Colors.red, // Set the background color to red
        selectedItemColor: Colors.white, // Set the selected item color to white
        unselectedItemColor: Colors.white.withOpacity(0.7), // Set the unselected item color to a lighter white
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.home),
                Text('Home', style: TextStyle(color: Colors.white)),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BikeCompanies()));
              },
              child: Column(
                children: [
                  Icon(Icons.motorcycle),
                  Text('Bike Companies', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: Column(
                children: [
                  Icon(Icons.person),
                  Text('Profile', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
