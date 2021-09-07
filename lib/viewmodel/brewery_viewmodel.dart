

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rnsolution/model/brewery.dart';
import 'package:rnsolution/services/server_manager.dart';

class BreweryViewModel extends ChangeNotifier{

  late List<BreweryItems> breweryitems=[];
  bool isApiInProgress = false;
  TextEditingController emailController = TextEditingController();

  void refreshIndicator() {
    if (isApiInProgress) {
      isApiInProgress = false;
    } else {
      isApiInProgress = true;
    }
    notifyListeners();
  }

  void initialize(){
    breweryitems = [];
    notifyListeners();
  }


  performBreweryFetch(
      {
        required void response(bool flag)}) {

    ServerManager.brewerList(

        completion: (responseBody, success) {
          if (success && responseBody != null) {
            debugPrint(" Response Body is "+ '${responseBody}');

            breweryitems=  breweryItemsFromJson(responseBody);
            debugPrint("Brewery Items are "+ '${breweryitems.length}');
            response(true);
            notifyListeners();
          } else {

            debugPrint(responseBody);
            response(false);
            notifyListeners();

          }
        });
  }

}
