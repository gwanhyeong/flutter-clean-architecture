import 'package:flutter/material.dart';

import '../../core/error/failures.dart';
import '../../core/util/usecase.dart';
import '../../domain/model/user.dart';
import '../../domain/usecase/login.dart';
import '../../domain/usecase/logout.dart';

class LoginScreenViewModel with ChangeNotifier {
  LoginUseCase loginUseCase;
  LogoutUseCase logoutUseCase;

  User? _user;
  User? get user => _user;

  LoginScreenViewModel(this.loginUseCase, this.logoutUseCase);

  void login(String id, String password) async {
    final failureOrUser = await loginUseCase.execute(LoginParams(id, password));
    failureOrUser.fold(
      (failure) {
        if (failure is ServerFailure) {
          _user = null;
          notifyListeners();
        }
      },
      (user) {
        _user = user;
        notifyListeners();
      },
    );
  }

  void logout() async {
    final failureOrBool = await logoutUseCase.execute(NoParams());
    failureOrBool.fold(
      (failure) => null,
      (isLogout) {
        _user = null;
        notifyListeners();
      },
    );
  }
}
