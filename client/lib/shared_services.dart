import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:client/Models/login_response_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class SharedService {

  static Future<bool> isLoggedIn() async {
    var isCacheKeyExist =
    await APICacheManager().isAPICacheKeyExist("login_details");

    return isCacheKeyExist;
  }


  static Future<LoginResponseModel?> loginDetails() async {
    var isCacheKeyExist =
    await APICacheManager().isAPICacheKeyExist("login_details");

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");
     print("${cacheData.syncData} KAAAAYN  loginDetails");

      return loginResponseJson(cacheData.syncData);
    }


  }

  static Future<void> setLoginDetails(
      LoginResponseModel loginResponse,
      ) async {
    APICacheDBModel cacheModel = APICacheDBModel(
      key: "login_details",
      syncData:jsonEncode(loginResponse.toJson()),
      // convert.jsonEncode(loginResponse),
    );

    await APICacheManager().addCacheData(cacheModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
          (route) => false,
    );
  }

}