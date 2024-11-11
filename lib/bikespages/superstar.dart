import 'package:flutter/material.dart';

class SuperStarBikes extends StatefulWidget {
  const SuperStarBikes({super.key});

  @override
  State<SuperStarBikes> createState() => _SuperStarBikesState();
}

class _SuperStarBikesState extends State<SuperStarBikes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('SUPER STAR', style: TextStyle(color: Colors.white, fontFamily: 'Alkatra', fontSize: 25),),
      ),
    );
  }
}
