import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/common/bloc/button/button_state.dart';
import 'package:practice_ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:practice_ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:practice_ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:practice_ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:practice_ecommerce/data/auth/models/user_signin_req.dart';
import 'package:practice_ecommerce/domain/auth/usecases/signin.dart';
import 'package:practice_ecommerce/presentation/auth/pages/forgot_password.dart';
import 'package:practice_ecommerce/presentation/home/pages/home.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq signinReq;
  EnterPasswordPage({super.key, required this.signinReq});
  final TextEditingController _passwordCon = TextEditingController(
    text: "cmylmZ.31",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }

              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(context, const HomePage());
              }
            },
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
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            signinReq.password = _passwordCon.text;
            context.read<ButtonStateCubit>().execute(
              usecase: SigninUseCase(),
              params: signinReq,
            );
          },
          title: "Continue",
        );
      },
    );
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
