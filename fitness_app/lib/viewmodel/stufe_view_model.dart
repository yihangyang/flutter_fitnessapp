  
import 'package:fitness_app/model/stufe_model.dart';
import 'package:flutter/material.dart';


class StufeViewModel with ChangeNotifier{

    List<ListData> _goodsList = [];
  
    List<ListData> get getGoodsList => _goodsList;

    set setGoodsList(List<ListData> goodsList) {
      _goodsList = goodsList;
      notifyListeners();
    }

    
}