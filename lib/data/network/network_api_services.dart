import 'dart:convert';
import 'dart:io';
import 'package:mvvm/data/app_execpations.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String uri) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(uri))
          .timeout(const Duration(seconds: 10));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on HttpException {
      throw FetchDataException("Couldn't find the data");
    } on FormatException {
      throw FetchDataException("Bad response format");
    } catch (e) {
      throw FetchDataException("Unexpected error: $e");
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String uri, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(uri), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      throw FetchDataException("Unexpected error: $e");
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with StatusCode : ${response.statusCode}');
    }
  }
}
