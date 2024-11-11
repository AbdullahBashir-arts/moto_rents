import 'package:flutter/material.dart';
import 'package:motorents/loginscreen.dart';
import 'package:motorents/signupscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          // Image Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Container
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/motoRents.png', height: 300, width: 300),
              ),

              const SizedBox(height: 20),
      
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Signup Container
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent.shade700,
                        ),
                        child: const Text('LOGIN', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white, fontFamily: 'Alkatra')),
                      ),
                    ),],
                ),
              ),
      
              //LogIn
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Login Container
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent.shade700,
                      ),
                      child: const Text('SIGN UP', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white, fontFamily: 'Alkatra')),
                    ),
                  ],
                ),
              )
      
      
            ],
          ),
        ),
      
      
      ),
    );
  }
}
