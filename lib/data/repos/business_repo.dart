import 'package:finzefy_app/core/services/api_service.dart';
import 'package:finzefy_app/data/models/business/update_business_info_payload.dart';
import 'package:finzefy_app/data/models/general/response.dart';

class BusinessRepo {
  ApiService apiService;
  BusinessRepo({required this.apiService});

  Future<ResponseModel> updateBusinessInfo(UpdateBusinessInfoPayload payload) async {
    return await apiService.postData(
        endpoint: "", body: payload.toJson(),);

  }
 
}