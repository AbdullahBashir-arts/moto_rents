import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  // Controllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data from SharedPreferences
  _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullNameController.text = prefs.getString('fullName') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      cnicController.text = prefs.getString('cnic') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
      addressController.text = prefs.getString('address') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
    });
  }

  // Save user data to SharedPreferences
  _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullNameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('cnic', cnicController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('address', addressController.text);
    await prefs.setString('password', passwordController.text);

    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red.shade900,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Alkatra',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(fullNameController, 'Full Name', Icons.perm_identity),
                SizedBox(height: 10),
                _buildTextField(emailController, 'Email', Icons.email_outlined),
                SizedBox(height: 10),
                _buildTextField(cnicController, 'CNIC', Icons.account_box_outlined),
                SizedBox(height: 10),
                _buildTextField(phoneController, 'Phone', Icons.phone),
                SizedBox(height: 10),
                _buildTextField(addressController, 'Address', Icons.location_on_outlined),
                SizedBox(height: 10),
                _buildTextField(passwordController, 'Password', Icons.lock_outline, obscureText: true),
          
                SizedBox(height: 30),
                if (isEditing)
                  ElevatedButton(
                    onPressed: _saveUserData,
                    child: Text('Save', style: TextStyle(fontFamily: 'Alkatra', color: Colors.red.shade900)),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = true;
                      });
                    },
                    child: Text('Edit', style: TextStyle(fontFamily: 'Alkatra', color: Colors.red)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build text fields
  Widget _buildTextField(TextEditingController controller, String label, IconData icon,
      {bool obscureText = false, String obscuringCharacter = '*'}) {

    return TextField(
        controller: controller,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        enabled: isEditing,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
                fontFamily: 'Alkatra',
                fontSize: 20,
                color: Colors.black.withOpacity(0.70)),
            prefixIcon: Icon(icon, color: Colors.red),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
        ),
    );
  }
}