class SendEmailOtpPayload{
  String email;
  SendEmailOtpPayload({required this.email,});

  Map<String, dynamic> toJson(){
    return{
      'email': email,
    };
  }
}

class VerifyEmailOtpPayload{
  String email, otp;
  VerifyEmailOtpPayload({required this.email, required this.otp,});

  Map<String, dynamic> toJson(){
    return{
      'email' : email,
      'otp': otp,
    };
  }
}