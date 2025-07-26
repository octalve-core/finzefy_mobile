class ChangePasswordPayload {
  String oldPassword;
  String newPassword;

  ChangePasswordPayload({required this.oldPassword, required this.newPassword});

  Map<String, dynamic> toJson(){
    return {
      'old_password' : oldPassword,
      'password' : newPassword
    };
  }
}

class ResetPasswordPayload {
  String email;
  String token;
  String password;
  //String passwordConfirmation;
  ResetPasswordPayload({required this.email, required this.token, required this.password, });

  Map<String, dynamic> toJson(){
    return{
      'email' : email,
      'token': token,
      'password' : password,
      //'password_confirmation' : passwordConfirmation
    };
  }
}



class VerifyTokenPayload {
  String email;
  String token;
  VerifyTokenPayload({required this.email, required this.token, });

  Map<String, dynamic> toJson(){
    return{
      'email' : email,
      'token': token,
    };
  }
}


