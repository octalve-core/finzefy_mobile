

class UpdateProfilePayload {
  UpdateProfilePayload({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneCode,
    required this.country,
    required this.username,
    required this.phone,
    this.gender,
   // this.fcmToken,
    this.avatar,
    required this.state,
    this.address
  });

  String firstName;
  String lastName;
  String email;
  String phoneCode;
  String country;
  String username;
  String phone;
  String? gender;
  String state;
 // String? fcmToken;
  String? avatar;
  String? address;

  Map<String, dynamic> toJson(){
    return  {
         "firstname": firstName,
          "lastname": lastName,
          "email": email,
          "phone_code": phoneCode,
          "country": country,
          "username": username,
          "phone": phone,
          "gender": gender,
          "state": state,
          //"fcm_token": fcmToken,
          //"avatar": avatar,
          "address": address
    };
  }
}
