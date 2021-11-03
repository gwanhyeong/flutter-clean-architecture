import '../../domain/usecase/login.dart';
import '../../domain/usecase/logout.dart';

class LoginScreenUseCase {
  final LoginUseCase login;
  final LogoutUseCase logout;

  const LoginScreenUseCase({
    required this.login,
    required this.logout,
  });
}
