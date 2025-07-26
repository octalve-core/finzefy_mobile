class ResponseCode{
  static const int success = 200;
  static const int badRequest = 400;
  static const int unAuthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;

  //local status code 
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int locationDenied = -7;
  static const int connectionErroe = 403;
} 


class ResponseMessage{
  // static const String success = "";
  // static const String badRequest = 400;
  // static const String unAuthorized = 401;
  // static const String forbidden = 403;
  // static const String notFound = 404;
  // static const String internalServerError = 500;

  //local status code 
  static const String connectionTimeout = "Unable to connect to the server. Please check your internet connection and try again";
  static const String cancel = "Connection cancelled";
  static const String receiveTimeout = "The server is taking too long to respond, Please try again later";
  static const String sendTimeout = "Failed to send data, Please check your network and try again";
  static const String cacheError = "Connection cacheError";
  static const String noInternetConnection = "No internet connection. Please check your network and try again.";
  static const String locationDenied = "locationDenied";
  static const String connectionError = "No internet connection. Please check your network and try again.";
}