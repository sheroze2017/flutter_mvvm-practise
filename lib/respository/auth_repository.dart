import 'package:mvvm_flutter/data/network/BaseApiService.dart';
import 'package:mvvm_flutter/data/network/NetworkApiService.dart';
import 'package:mvvm_flutter/resources/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPnt, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerApiEndPnt, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
