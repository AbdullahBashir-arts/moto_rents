import 'package:flutter/material.dart';

class RaviBikes extends StatefulWidget {
  const RaviBikes({super.key});

  @override
  State<RaviBikes> createState() => _RaviBikesState();
}

class _RaviBikesState extends State<RaviBikes> {
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
            'HONDA',
            style: TextStyle(color: Colors.white, fontFamily: 'Alkatra', fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Image.asset('assets/CompaniesLogo/hondalogo.png', height: 150, width: 200),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _bikeCard('Honda 70 CD Bike in Blue Color', '2000 PKR (per day)', 'assets/BikeImages/HondaBikeImages/70CD.jpeg', 'Honda 70 CD', () => _showRentRequest('Honda 70 CD')),
                    _bikeCard('Honda 70 CD (Dream) Bike in Red Color', '2000 PKR (per day)', 'assets/BikeImages/HondaBikeImages/70CD(dream).jpeg', 'Honda 70 CD (Dream)', () => _showRentRequest('Honda 70 CD (Dream)')),
                    _bikeCard('Honda Pridor Bike in Red Color', '2500 PKR (per day)', 'assets/BikeImages/HondaBikeImages/pridor.jpeg', 'Honda Pridor', () => _showRentRequest('Honda Pridor')),
                    _bikeCard('Honda CG125 Bike in Black Color', '3000 PKR (per day)', 'assets/BikeImages/HondaBikeImages/CG125.jpeg', 'Honda CG125', () => _showRentRequest('Honda CG125')),
                    _bikeCard('Honda CG125 (Dream) Bike in Black Color', '3000 PKR (per day)', 'assets/BikeImages/HondaBikeImages/CG125(dream).jpeg', 'Honda CG125 (Dream)', () => _showRentRequest('Honda CG125 (Dream)')),
                    _bikeCard('Honda CB 150-F Bike in Black Color', '3500 PKR (per day)', 'assets/BikeImages/HondaBikeImages/CB150F.jpeg', 'Honda CB 150-F', () => _showRentRequest('Honda CB 150-F')),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'Location: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        '[Enter your Location]',
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
