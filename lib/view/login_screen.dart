import 'package:flutter/material.dart';
import 'package:mvvm/respository/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../res/components/cusotm_text_form_fild.dart';
import '../unitls/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: email,
                hintText: "Enter your email",
                labelText: "Email",
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  Utils.fouchNoteMessage(context, emailFocus, passwordFocus);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: password,
                hintText: "Enter your Password",
                labelText: "Password",
                prefixIcon: Icons.password,
                obscureText: true,
                onFieldSubmitted: (value) {
                  Utils.fouchNoteMessage(context, passwordFocus, emailFocus);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                   if(email.text.isEmpty){
                     Utils.flushBarErrorMessage('Enter Your Email', context);
                   }else if(password.text.isEmpty){
                     Utils.showSnackBar('Enter Your Password', context);
                   }else if(password.text.length< 6){
                     Utils.flushBarErrorMessage('Enter 6 Detgets Passwoed', context);
                   }else{
                     debugPrint('Api Hit in UI ');
                     Map data = {
                       'email': email.text.toString(),
                       'password': password.toString(),
                     };
                     authViewModel.loginApi(data,context);
                   }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
