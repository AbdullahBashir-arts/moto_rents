import 'package:flutter/material.dart';

class UnitedBikes extends StatefulWidget {
  const UnitedBikes({super.key});

  @override
  State<UnitedBikes> createState() => _UnitedBikesState();
}

class _UnitedBikesState extends State<UnitedBikes> {
  void _showRentRequest(String bikeName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rent Request'),
          content: Text('You want to rent this bike: $bikeName'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the first dialog
                _showConfirmationDialog(); // Show the confirmation dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text(
              'OKAY! YOUR DESIRED BIKE WILL BE DELIVERED AT YOUR GIVEN LOCATION AS SOON AS POSSIBLE...!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the confirmation dialog
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red.shade700,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'UNITED',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Alkatra', fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Image.asset('assets/CompaniesLogo/unitedlogo.png',
                height: 150, width: 200),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _bikeCard(
                      'United US 70 Bike in Red Color',
                      '2000 PKR (per day)',
                      'https://cache4.pakwheels.com/system/bike_model_pictures/1656/original/1.jpg?1668150693', // Replace with actual URL
                      'United US 70',
                          () => _showRentRequest('United US 70'),
                    ),
                    _bikeCard(
                      'United US 100 Bike in Red Color',
                      '2000 PKR (per day)',
                      'https://cache2.pakwheels.com/system/bike_model_pictures/2139/original/united_us_100-removebg-preview.png?1704355754', // Replace with actual URL
                      'United US 100',
                          () => _showRentRequest('United US 100'),
                    ),
                    _bikeCard(
                      'United US 125 Bike in Red Color',
                      '2500 PKR (per day)',
                      'https://cache3.pakwheels.com/system/bike_model_pictures/974/original/United_US125.jpg?1448607067', // Replace with actual URL
                      'Honda Pridor',
                          () => _showRentRequest('Honda Pridor'),
                    ),
                    // _bikeCard(
                    //   'Honda CG125 Bike in Black Color',
                    //   '3000 PKR (per day)',
                    //   'https://example.com/honda_cg125.jpg', // Replace with actual URL
                    //   'Honda CG125',
                    //       () => _showRentRequest('Honda CG125'),
                    // ),
                    // _bikeCard(
                    //   'Honda CG125 (Dream) Bike in Black Color',
                    //   '3000 PKR (per day)',
                    //   'https://example.com/honda_cg125_dream.jpg', // Replace with actual URL
                    //   'Honda CG125 (Dream)',
                    //       () => _showRentRequest('Honda CG125 (Dream)'),
                    // ),
                    // _bikeCard(
                    //   'Honda CB 150-F Bike in Black Color',
                    //   '3500 PKR (per day)',
                    //   'https://example.com/honda_cb150f.jpg', // Replace with actual URL
                    //   'Honda CB 150-F',
                    //       () => _showRentRequest('Honda CB 150-F'),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bikeCard(String bikeDescription, String rent, String imageUrl,
      String bikeName, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Center(
                    child: Image.network(imageUrl),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    bikeDescription,
                    style: TextStyle(
                      fontFamily: 'Alkatra',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'Rent: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        rent,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
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
