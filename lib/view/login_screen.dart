import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../unitls/routes/routes_naem.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: InkWell(child: Text('Go'),
          onTap: (){
            Get.offAllNamed(RoutesName.home);

          },
        ),
      ),
    );
  }
}
