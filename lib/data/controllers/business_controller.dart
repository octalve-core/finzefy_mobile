import 'package:finzefy_app/data/models/business/update_business_info_payload.dart';
import 'package:finzefy_app/data/models/general/response.dart';
import 'package:finzefy_app/data/repos/business_repo.dart';
import 'package:flutter/material.dart';

class BusinessController extends ChangeNotifier {
  BusinessRepo businessRepo;
  BusinessController({required this.businessRepo});

  Future<ResponseModel> updateBusinessInfo(UpdateBusinessInfoPayload payload) async {
    final response = await businessRepo.updateBusinessInfo(payload);
    return response;
  }
}
