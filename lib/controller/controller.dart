import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/data/book_data.dart';

class Controller extends GetxController{
  var livre = Livre();
  var count = 0.obs;
  void increment(){
    count++;
  }
  void mettreEnMajuscule() {
    livre.titre.value = livre.titre.value.toUpperCase();
    update();
  }

  void changerDeLangue(var param1, param2){
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
}