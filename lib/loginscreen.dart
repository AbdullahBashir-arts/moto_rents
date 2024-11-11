import 'package:flutter/material.dart';
import 'package:motorents/bikesmainpage.dart';
import 'package:motorents/data/databasehelper.dart';
import 'package:motorents/signupscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Map<String, dynamic>? user = await databaseHelper.getUser(email!);
      if (user != null && user['password'] == password) {
        // Save login state in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        prefs.setString('email', email!);

        Navigator.push(context, MaterialPageRoute(builder: (context)=> BikeMainPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid credentials")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.red.shade700,
            title: Text('Login', style: TextStyle(color: Colors.white, fontFamily: 'Alkatra'),)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset('assets/motoRents.png', height: 200, width: 200,),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('LOGIN', style: TextStyle(color: Colors.red.shade700, fontFamily: 'Alkatra', fontSize: 40),),
                        SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              label: Text('Email'),
                              border: InputBorder.none,
                              enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  )
                                    
                              )
                          ),
                          validator: (value) => value!.isEmpty ? 'Enter your email' : null,
                          onSaved: (value) => email = value,
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              label: Text('Password'),
                              border: InputBorder.none,
                              enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  )
                                    
                              )
                          ),
                          obscureText: true,
                          validator: (value) => value!.isEmpty ? 'Enter your password' : null,
                          onSaved: (value) => password = value,
                        ),
                        SizedBox(height: 25),
                        GestureDetector(
                          onTap: _login,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.red.shade700,
                              ),
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Alkatra',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",style: TextStyle(fontSize: 15,)),
                            SizedBox(width: 2,),
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                                },
                                child: Text('SignUp',style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, decoration: TextDecoration.underline, color: Colors.red.shade700, fontWeight: FontWeight.bold, fontFamily: 'Alkatra')))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}