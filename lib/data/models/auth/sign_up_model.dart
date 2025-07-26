class SignUpPayload {
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;

  SignUpPayload({
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
    };
  }
}
