import '../../core/error/failures.dart';
import '../../domain/usecase/login.dart';

class LoginScreenViewModel {
  final LoginUseCase loginUseCase;

  LoginScreenViewModel(this.loginUseCase);

  void login(String id, String password) async {
    final failureOrUser = await loginUseCase.execute(LoginParams(id, password));
    failureOrUser.fold(
      (failure) {
        if (failure is ServerFailure) {
          print(failure.message);
        }
      },
      (user) => null,
    );
  }
}
