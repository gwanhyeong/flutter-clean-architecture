import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/util/usecase.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

class LoginUseCase extends UseCase<User, LoginParams> {
  final UserRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, User>> execute(LoginParams params) async {
    return await _repository.login(params.id, params.password);
  }
}

class LoginParams extends Equatable {
  final String id;
  final String password;

  const LoginParams(this.id, this.password);

  @override
  List<Object> get props => [id, password];
}