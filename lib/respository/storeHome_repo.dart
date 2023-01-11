import 'package:mvvm_flutter/model/store_model.dart';
import 'package:mvvm_flutter/resources/app_url.dart';

import '../data/network/BaseApiService.dart';
import '../data/network/NetworkApiService.dart';

class StoreHomeRepo {
  BaseApiServices _apiServices = NetworkApiService();
  Future<storeItem> fetchStore() async {
    try {
      dynamic response = await _apiServices.getApiResponse(AppUrl.storeproduct);
      return response = storeItem.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
