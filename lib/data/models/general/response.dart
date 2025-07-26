class ResponseModel{
  bool isSuccess;
  String? message;
  dynamic data;

  ResponseModel({required this.isSuccess,  this.message, this.data});
}