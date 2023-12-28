import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:km_test/model/api_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future getUser() async {
    try {
      final response = await _dio.get("https://reqres.in/api/users");
      debugPrint('service : $response');
      final ApiModel result = ApiModel.fromJson(response.data);
      debugPrint('$result');
      return result;
    } catch (e) {
      return e;
    }
  }

  Future postUser({
    required String? firstName,
    String? email,
    String? avatar,
    String? lastName,
  }) async {
    try {
      final response = await _dio.post("https://reqres.in/api/users", data: {
        'firsName': firstName,
        'lastName': lastName,
        'email': email,
        'avatar': avatar,
      });
      debugPrint('service : $response');
      final ApiModel result = ApiModel.fromJson(response.data);
      debugPrint('$result');
      return result;
    } catch (e) {
      return e;
    }
  }
}
