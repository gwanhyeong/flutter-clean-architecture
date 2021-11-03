import 'package:flutter/material.dart';

import '../../core/error/exceptions.dart';
import '../../core/util/usecase.dart';
import '../../domain/model/user.dart';
import '../../domain/usecase/login.dart';
import 'usecase.dart';

class LoginScreenViewModel with ChangeNotifier {
  LoginScreenUseCase useCase;

  User? _user;
  User? get user => _user;

  LoginScreenViewModel(this.useCase);

  void login(String id, String password) async {
    final failureOrUser = await useCase.login(LoginParams(id, password));
    failureOrUser.fold(
      (failure) {
        if (failure is UnauthorisedException) {
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
    final failureOrBool = await useCase.logout(NoParams());
    failureOrBool.fold(
      (failure) => null,
      (isLogout) {
        _user = null;
        notifyListeners();
      },
    );
  }
}
