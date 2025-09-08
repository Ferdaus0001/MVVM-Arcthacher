import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic respons = await _apiServices.getPostApiResponse(
        AppUrlEndpoint.loginUrl,
        data,
      );
      return respons;
    } catch (e) {
      throw e;
    }
  }

    Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic respons = await _apiServices.getPostApiResponse(
        AppUrlEndpoint.baseUrl,
        data,
      );
      return respons;
    } catch (e) {
      throw e;
    }
  }


}
