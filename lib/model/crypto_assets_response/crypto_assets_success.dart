// To parse this JSON data, do
//
//     final cryptoAssetsSuccessResponse = cryptoAssetsSuccessResponseFromJson(jsonString);

import 'dart:convert';

List<CryptoAssetsSuccessResponse> cryptoAssetsSuccessResponseFromJson(String str) => List<CryptoAssetsSuccessResponse>.from(json.decode(str).map((x) => CryptoAssetsSuccessResponse.fromJson(x)));

String cryptoAssetsSuccessResponseToJson(List<CryptoAssetsSuccessResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CryptoAssetsSuccessResponse {
  String assetId;
  String url;

  CryptoAssetsSuccessResponse({
    required this.assetId,
    required this.url,
  });

  factory CryptoAssetsSuccessResponse.fromJson(Map<String, dynamic> json) => CryptoAssetsSuccessResponse(
    assetId: json["asset_id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "asset_id": assetId,
    "url": url,
  };
}
