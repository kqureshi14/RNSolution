import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

typedef void ResponseCompletion(String responseBody, bool success);
typedef void ResponseCallBack(bool success, Map json, String response);

class ServerManager {
  static const int successResponseCode = 200;

  ///Default constructor for private declaration
  ServerManager._();
  static Map _defaultHeader() {
    Map<dynamic, dynamic> requestHeaders = {'Content-Type': 'application/json'};
    return requestHeaders;
  }

  static void brewerList({required ResponseCompletion completion}) {
    callGetApi("https://api.openbrewerydb.org/breweries", {'Content-Type': 'application/json'}, completion);
  }

  ///method for get api
  static void callGetApi(
      String url, Map<dynamic,dynamic> defaultHeader, ResponseCompletion completion) {
    http.get(Uri.parse(url), headers: {'Content-Type': 'application/json'}).then((response) {
      // debugPrint(json.toString());
      if (response != null && response.statusCode == successResponseCode) {
        debugPrint(response.body);
        completion(response.body, true);
      } else {
        debugPrint(response.body);
        completion(response.body, false);
      }
    });
  }
}
