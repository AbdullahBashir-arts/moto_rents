import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  Cards({super.key, required this.title, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'BungeeTint',
                  fontSize: 23,
                ),
              ),
            ),
            height: 150,
          ),
        ),
      ),
    );
  }
}