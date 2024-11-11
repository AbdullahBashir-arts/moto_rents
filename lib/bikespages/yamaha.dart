import 'package:flutter/material.dart';

class YamahaBikes extends StatefulWidget {
  const YamahaBikes({super.key});

  @override
  State<YamahaBikes> createState() => _YamahaBikesState();
}

class _YamahaBikesState extends State<YamahaBikes> {
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
            'YAMAHA',
            style: TextStyle(color: Colors.white, fontFamily: 'Alkatra', fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Image.asset('assets/CompaniesLogo/yamahalogo.png', height: 150, width: 200),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _bikeCard('Yamaha 125-Z Bike in Red Color', '2000 PKR (per day)', 'assets/BikeImages/YamahaBikeImages/YB125Z.jpeg', 'Honda 70 CD', () => _showRentRequest('Yamaha YB 125-Z')),
                    _bikeCard('Yamaha 125-ZDX Bike in Black Color', '2000 PKR (per day)', 'assets/BikeImages/YamahaBikeImages/YB125ZDX.jpeg', 'Honda 70 CD (Dream)', () => _showRentRequest('Yamaha YB 125-ZDX')),
                    _bikeCard('Yamaha YBR 125 Bike in Red Color', '2500 PKR (per day)', 'assets/BikeImages/YamahaBikeImages/YBR125.jpeg', 'Honda Pridor', () => _showRentRequest('Yamaha YBR 125')),
                    _bikeCard('Yamaha YBR 125-G Bike in Red Color', '3000 PKR (per day)', 'assets/BikeImages/YamahaBikeImages/YBR125G.jpeg', 'Honda CG125', () => _showRentRequest('Yamaha YBR 125-G')),
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
