// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:km_test/model/api_model.dart';
import 'package:km_test/model/service/api_service.dart';

class ContactListViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  ApiModel? _apiModel;
  ApiModel? get apiModel => _apiModel;

  Future fetchDataFromApi() async {
    try {
      _apiModel = await _apiService.getUser();
      debugPrint('view model : $_apiModel');
      notifyListeners();
      return _apiModel!;
    } catch (e) {
      throw Exception('Gagal mendapatkan data: $e');
    }
  }

  Future postDataToApi({
    required String? firstName,
    String? email,
    String? avatar,
    String? lastName,
  }) async {
    try {
      _apiModel = await _apiService.postUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        avatar: avatar,
      );
      debugPrint('post: $_apiModel');
      notifyListeners();
      return _apiModel!;
    } catch (e) {
      throw Exception('Gagal post data: $e');
    }
  }
}
