import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:practice_ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:practice_ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:practice_ecommerce/data/auth/models/user_creation_req.dart';
import 'package:practice_ecommerce/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:practice_ecommerce/presentation/auth/pages/signin.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _firstNameCon = TextEditingController(
    text: "Süleyman",
  );
  final TextEditingController _lastNameCon = TextEditingController(
    text: "Harbelioğlu",
  );
  final TextEditingController _emailCon = TextEditingController(
    text: "harba.suleyman@gmail.com",
  );
  final TextEditingController _passwordCon = TextEditingController(
    text: "cmylmZ.31",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signinText(),
              SizedBox(height: 20),
              _firstNameField(),
              SizedBox(height: 20),
              _lastNameField(),
              SizedBox(height: 20),
              _emailField(),
              SizedBox(height: 20),
              _passwordField(),
              SizedBox(height: 20),
              _continueButton(context),
              SizedBox(height: 20),
              _alreadyHaveAccount(context),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _signinText() {
    return Text(
      "Create Account",
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  _firstNameField() {
    return TextField(
      controller: _firstNameCon,
      decoration: InputDecoration(hintText: "Firstname"),
    );
  }

  _lastNameField() {
    return TextField(
      controller: _lastNameCon,
      decoration: InputDecoration(hintText: "Lastname"),
    );
  }

  _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(hintText: "Email"),
    );
  }

  _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(hintText: "Password"),
    );
  }

  _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelectionPage(
            userCreationReq: UserCreationReq(
              firstName: _firstNameCon.text,
              email: _emailCon.text,
              lastName: _lastNameCon.text,
              password: _passwordCon.text,
            ),
          ),
        );
      },
      title: "Continue",
    );
  }

  Widget _alreadyHaveAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Do you have an account? "),
          TextSpan(
            text: 'Signin',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, SigninPage());
              },
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
