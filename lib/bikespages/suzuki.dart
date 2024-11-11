import 'package:flutter/material.dart';

class SuzukiBikes extends StatefulWidget {
  const SuzukiBikes({super.key});

  @override
  State<SuzukiBikes> createState() => _SuzukiBikesState();
}

class _SuzukiBikesState extends State<SuzukiBikes> {
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
          content: Text('OKAY! YOUR DESIRED BIKE WILL BE DELIVERED AT YOUR GIVEN LOCATION AS SOON AS POSSIBLE...!'),
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
            'SUZUKI',
            style: TextStyle(color: Colors.white, fontFamily: 'Alkatra', fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Image.asset('assets/CompaniesLogo/suzukilogo.png', height: 150, width: 200),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _bikeCard('Suzuki GD 100-S Bike in Blue Color', '2000 PKR (per day)', 'assets/BikeImages/SuzukiBikeImages/GD110S.jpeg', 'Honda 70 CD', () => _showRentRequest('Suzuki GD 110-S')),
                    _bikeCard('Suzuki GR 150 Bike in Black Color', '2000 PKR (per day)', 'assets/BikeImages/SuzukiBikeImages/GR150.jpeg', 'Honda 70 CD (Dream)', () => _showRentRequest('Suzuki GR 150')),
                    _bikeCard('Suzuki GS 150 Bike in Red Color', '2500 PKR (per day)', 'assets/BikeImages/SuzukiBikeImages/GS150.jpeg', 'Honda Pridor', () => _showRentRequest('Honda Pridor')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bikeCard(String bikeDescription, String rent, String imagePath, String bikeName, VoidCallback onTap) {
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
                  child: Center(child: Image.asset(imagePath)),
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
