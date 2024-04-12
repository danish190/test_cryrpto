import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../model/crypto_assets_response/crypto_assets_success.dart';
import '../network/api_client.dart';
import '../utils/status_codes.dart';

class CryptoAssetsController extends GetxController{
  bool isLoading = false;

  late List<String> assetId=[];
  late List<String> urls=[];

  Future<void> cryptoAssets () async{
    isLoading = true;
    update();
    dio.Response response = await ApiClient.cryptoAssets();
    isLoading = false;
    update();

    if (response.statusCode! >= HttpStatusCodes.OK) {
      String responseJson = json.encode(response.data);
    final cryptoAssetsSuccessResponse = cryptoAssetsSuccessResponseFromJson(responseJson);
      print("logout response $cryptoAssetsSuccessResponse");
      cryptoAssetsSuccessResponse.forEach((element) {
        element.assetId;
        print('assets ${element.assetId}');
        assetId.add(element.assetId)  ;
        urls.add(element.url)  ;
      update();
      });
      update();

    } else {
      print('nothing');
    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cryptoAssets();
  }
}