import 'package:cha_sa_jo_flutter/constants/image_strings.dart';
import 'package:cha_sa_jo_flutter/constants/sizes.dart';
import 'package:cha_sa_jo_flutter/constants/text_strings.dart';
import 'package:cha_sa_jo_flutter/view/login/login_screen.dart';
import 'package:cha_sa_jo_flutter/widget/signup/form_header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForgetWidget extends StatefulWidget {
  const LoginForgetWidget({super.key});

  @override
  State<LoginForgetWidget> createState() => _LoginForgetWidgetState();
}

class _LoginForgetWidgetState extends State<LoginForgetWidget> {
  String Email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Center(
          child: Column(
            children: [
              const FormHeaderWidget(
                  image: tSplashImage,
                  title: 'Reset Password',
                  subTitle: 'Check your Email and reset your password.'),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  Email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      resetPassword(Email, context);
                    },
                    child: const Text('Send Email')),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _showDialog(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("This email is not registered."),
        ),
      );
    }
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Transmission Results'),
          content: const Text('I sent you an email.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
                Get.to(const LoginScreen());
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }
}
