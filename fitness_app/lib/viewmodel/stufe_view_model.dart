  
import 'dart:convert';

import 'package:fitness_app/model/stufe_model.dart';
import 'package:fitness_app/service/http_request.dart';
import 'package:flutter/material.dart';


class StufeViewModel with ChangeNotifier{
  StufeViewModel() {
    _getStufe().then((res) {
      setGoodsList = res;
    });
  }
  List<ListData> _goodsList = [];

  List<ListData> get getGoodsList => _goodsList;

  set setGoodsList(List<ListData> goodsList) {
    _goodsList = goodsList;
    notifyListeners();
  }

  Future<List<ListData>> _getStufe() async{
    final String val = await request('stufe');
    var data = json.decode(val.toString());
    final dataArray = data['data'];
    List<ListData> stufes = [];
    for(var json in dataArray) {
      stufes.add(ListData.fromJson(json));
    }
    return stufes;
  }
}