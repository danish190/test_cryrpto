import '../utils/app_constants.dart';
import 'package:dio/dio.dart' as dio;

import 'api_method.dart';

class ApiClient {
  ApiClient._internal();

  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    return _singleton;
  }

  static Future<dio.Response> cryptoAssets() async {
    var url = AppConstants.BASE_URL + AppConstants.GET_CRYPTOAssets;

    dio.Response response = await ApiMethods.getMethod(
        headers: {
      "Content-Type": "application/json"
    }, url: url);
    try {
      return response;
    } on dio.DioError catch (e) {
      if (e.message == "Receiving data timeout[50000ms]") {
        return response;
      }
      if (e.message == "Http status error [401]") {
        return response;
      } else if (e.message == "Http status error [500]") {
        return response;
      }
      return response;
    }
  }
}