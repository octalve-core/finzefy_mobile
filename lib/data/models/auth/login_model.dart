
class LoginPayload{
  LoginPayload({
    required this.password,
    required this.email,
    //this.fcmToken
  }) ;
  String email;
  String password;
 // String? fcmToken;

  Map<String, dynamic> toJson(){
    return {
      'email' : email,
      'password' : password,
      //'fcm_token' : fcmToken
    };
  }
}
