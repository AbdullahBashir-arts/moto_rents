import 'package:motorents/Components/cards.dart';
import 'package:motorents/bikespages/honda.dart';
import 'package:motorents/bikespages/ravi.dart';
import 'package:motorents/bikespages/superpower.dart';
import 'package:motorents/bikespages/superstar.dart';
import 'package:motorents/bikespages/suzuki.dart';
import 'package:motorents/bikespages/united.dart';
import 'package:motorents/bikespages/yamaha.dart';
import 'package:motorents/bikespages/zxmco.dart';
import 'package:motorents/homepage.dart';
import 'package:flutter/material.dart';

class BikeCompanies extends StatefulWidget {
  const BikeCompanies({super.key});

  @override
  State<BikeCompanies> createState() => _BikeCompaniesState();
}

class _BikeCompaniesState extends State<BikeCompanies> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop((context), MaterialPageRoute(builder: (context) => HomePage()));
          },
            child: Icon(Icons.arrow_back_rounded, color: Colors.white,)),

        backgroundColor: Colors.red.shade700,
        title: Text('Select Bike Model',
          style: TextStyle(
              color: Colors.white,
            fontFamily: 'Alkatra',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        // Main Column
        Column(
          children: [

            // Row 1 with 2 Categories
            Cards(title: 'Honda', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HondaBikes()));
            }),
            SizedBox(height: 10,),
            Cards(title: 'Yamaha', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => YamahaBikes()));
            }),
            SizedBox(height: 10,),

            // Single Category 1
                Cards(title: 'Super Power',onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SuperPowerBikes()));
                }),

                SizedBox(height: 10,),

            // Row 2 with 2 Categories
            Cards(title: 'Suzuki', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SuzukiBikes()));
            }),

            SizedBox(height: 10,),

            Cards(title: 'United', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UnitedBikes()));
            }),
            SizedBox(height: 10,),
          ],
        ),
      ),

    );

  }
}
