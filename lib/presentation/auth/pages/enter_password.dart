import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:practice_ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:practice_ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:practice_ecommerce/presentation/auth/pages/forgot_password.dart';

class EnterPasswordPage extends StatelessWidget {
  EnterPasswordPage({super.key});
  final TextEditingController _passwordCon = TextEditingController(
    text: "cmylmZ.31",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            SizedBox(height: 20),
            _passwordField(context),
            SizedBox(height: 20),
            _continueButton(context),
            SizedBox(height: 20),
            _forgetPassword(context),
          ],
        ),
      ),
    );
  }

  _signinText(BuildContext context) {
    return Text(
      "Sign in",
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(hintText: "Enter Password"),
    );
  }

  _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: () {}, title: "Continue");
  }

  _forgetPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Forgot password?"),
          TextSpan(
            text: " Reset",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, ForgotPasswordPage());
              },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
