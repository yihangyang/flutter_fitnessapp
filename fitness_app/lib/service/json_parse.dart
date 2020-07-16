import 'dart:convert';

import 'package:fitness_app/model/stufe_model.dart';
import 'package:flutter/services.dart';

class JsonParse {
  static Future<List<StufeModel>> getCategoryData() async {
    // 1. load json.data
    final jsonString = await rootBundle.loadString("assets/json/category.json");
    // 2. json => map/list
    final result = json.decode(jsonString);
    // 3. map => object
    final resultList = result['category'];
    List<StufeModel> categories = [];
    for(var json in resultList) {
      categories.add(StufeModel.fromJson(json));
    }
    return categories;
  }
}