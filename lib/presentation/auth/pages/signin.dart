import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:practice_ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:practice_ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:practice_ecommerce/data/auth/models/user_signin_req.dart';
import 'package:practice_ecommerce/presentation/auth/pages/enter_password.dart';
import 'package:practice_ecommerce/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _emailCon = TextEditingController(
    text: "harba.suleyman@gmail.com",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            SizedBox(height: 20),
            _emailField(),
            SizedBox(height: 20),
            _continueButton(context),
            SizedBox(height: 20),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text(
      "Sign in",
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(hintText: "Enter Email"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          EnterPasswordPage(signinReq: UserSigninReq(email: _emailCon.text)),
        );
      },
      title: "Continue",
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Don't you hava an account?"),
          TextSpan(
            text: " Create one",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignupPage());
              },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
