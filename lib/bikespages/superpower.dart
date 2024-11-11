import 'package:flutter/material.dart';

class SuperPowerBikes extends StatefulWidget {
  const SuperPowerBikes({super.key});

  @override
  State<SuperPowerBikes> createState() => _SuperPowerBikesState();
}

class _SuperPowerBikesState extends State<SuperPowerBikes> {
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
            'HONDA',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Alkatra', fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Image.asset('assets/CompaniesLogo/superpowerlogo.png',
                height: 150, width: 200),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _bikeCard(
                      'Super Power SP 70 Bike in Red Color',
                      '2000 PKR (per day)',
                      'https://cache4.pakwheels.com/system/bike_model_pictures/970/original/Super_Power_SP70.jpg?1448606971',
                      'Super Power SP 70',
                          () => _showRentRequest('Super Power SP 70'),
                    ),

                    _bikeCard(
                      'Super Power SP 125 Bike in Red Color',
                      '2000 PKR (per day)',
                      'https://cache4.pakwheels.com/system/bike_model_pictures/969/original/Super_Power_SP125.jpg?1448606967',
                      'Super Power SP 125',
                          () => _showRentRequest('Super Power SP 125'),
                    ),

                    _bikeCard(
                      'Super Power SP 150 Archi Bike in Red Color',
                      '2500 PKR (per day)',
                      'https://cache2.pakwheels.com/system/bike_model_pictures/1608/original/1.jpg?1668061953',
                      'SP 150 Archi',
                          () => _showRentRequest('SP 150 Archi'),
                    ),

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
                  child: Center(child: Image.network(imageUrl)),
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
