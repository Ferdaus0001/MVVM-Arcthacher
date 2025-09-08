import 'package:flutter/cupertino.dart';
import 'package:mvvm/respository/auth_repo.dart';
import 'package:mvvm/unitls/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loadign = false;
  bool get loadign => _loadign;
 setLoadign(bool value ){
   _loadign =  value; notifyListeners();
 }
  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage('Login Successful', context);
      // success response handle here
      debugPrint("Login Success: $value");
    }).onError((error, stackTrace) {
      // error response handle here
      Utils.flushBarErrorMessage('Errro$error', context);
      debugPrint("Login Error: $error");
    });
  }
}
