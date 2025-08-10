import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/domain/auth/usecases/get_user.dart';
import 'package:practice_ecommerce/presentation/home/bloc/user_info_display_state.dart';
import 'package:practice_ecommerce/service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUseCase>().call();

    returnedData.fold(
      (error) {
        emit(LoadUserInfoFailure());
      },
      (data) {
        UserInfoLoaded(user: data);
      },
    );
  }
}
