class userData {
  int? id;
  String fullName ;
  String email;
  String cnic;
  String phone;
  String password;
  String confirmPassword;

  userData({this.id, required this.fullName, required this.email, required this.cnic, required this.phone, required this.password, required this.confirmPassword});

  Map<String, dynamic> toMap() {
    return {
      'FirstName': fullName,
      'email' : email,
      'cnic' : cnic,
      'phone' : phone,
      'password': password,
      'confirmPassword' : confirmPassword
    };
  }
}
