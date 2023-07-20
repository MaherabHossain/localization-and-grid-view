import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class CountryController extends GetxController {
  var countries = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    String jsonString = await rootBundle.loadString('assets/countries.json');
    var data = jsonDecode(jsonString);
    for(int i=0; i<data.length-1;++i){
      if(data[i]['currencies']!=null){
        String key = data[i]["currencies"].keys.toList().first;
        String currencyName = data[i]["currencies"][key]['name'];
        List<String> words = currencyName.split(' ');
        if(words.length==2){
          // print();
          countries.add(data[i]['name']['common']);
          print(data[i]['name']['common']);
        }
      }
      // String key = data[i]["currencies"].keys.toList().first;

      // print(key);
    }
  }
}
