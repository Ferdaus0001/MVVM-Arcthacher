import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mvvm/unitls/routes/routes_naem.dart';
import 'package:mvvm/view/home_screen.dart';

class Routes{

  static Future? generateRoute(RouteSettings setting){
    switch(setting.name){
      case RoutesName.home:
        return Get.to(HomeScreen()
        );
      default:

    }
    return null;
  }
}