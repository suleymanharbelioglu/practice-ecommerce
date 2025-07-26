import 'package:flutter/material.dart';
import 'package:practice_ecommerce/common/widets/appbar/app_bar.dart';
import 'package:practice_ecommerce/common/widets/button/basic_app_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _siginText(),
            const SizedBox(height: 20),
            _emailField(),
            const SizedBox(height: 20),
            _continueButton(),
          ],
        ),
      ),
    );
  }

  Widget _siginText() {
    return const Text(
      'Forgot Password',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Enter Email'),
    );
  }

  Widget _continueButton() {
    return Builder(
      builder: (context) {
        return BasicAppButton(onPressed: () {}, title: 'Continue');
      },
    );
  }
}
