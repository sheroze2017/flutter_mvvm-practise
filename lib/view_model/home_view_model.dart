import 'package:flutter/cupertino.dart';
import 'package:mvvm_flutter/data/response/api_response.dart';
import 'package:mvvm_flutter/model/store_model.dart';
import 'package:mvvm_flutter/respository/storeHome_repo.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = StoreHomeRepo();

  ApiResponse<storeItem> storeList = ApiResponse.loading();

  setItemList(ApiResponse<storeItem> response) {
    storeList = response;
    notifyListeners();
  }

  Future<void> fetchStoreApi() async {
    setItemList(ApiResponse.loading());
    _myRepo.fetchStore().then((value) {
      setItemList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setItemList(ApiResponse.error(error.toString()));
    });
  }
}
