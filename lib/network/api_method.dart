import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

class ApiMethods {
  static dio.Dio dioObj = dio.Dio();

  static Future<dio.Response> getMethod(
      {required Map<String, dynamic> headers, required String url}) async {
    dio.Response response = await dioObj.get(
      url,
      options: Options(
          responseType: ResponseType.json,
          headers: headers,
          receiveTimeout: const Duration(milliseconds: 100000),
          sendTimeout: const Duration(milliseconds: 100000),
          validateStatus: (status) {
            return status! < 500;
          },
          receiveDataWhenStatusError: false),
    );

    if (response.statusCode! >= 400) {}

    return response;
  }


}