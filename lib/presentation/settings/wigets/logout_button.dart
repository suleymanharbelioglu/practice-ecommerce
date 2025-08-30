import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/common/bloc/button/button_state.dart';
import 'package:practice_ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:practice_ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:practice_ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:practice_ecommerce/domain/auth/usecases/logout.dart';
import 'package:practice_ecommerce/presentation/auth/pages/signin.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
              AppNavigator.pushAndRemove(context, SigninPage());
            }
          },
          child: Builder(
            builder: (context) {
              return BasicReactiveButton(
                onPressed: () {
                  context.read<ButtonStateCubit>().execute(
                    usecase: LogoutUseCase(),
                  );
                },
                title: "Logut",
              );
            },
          ),
        ),
      ),
    );
  }
}
