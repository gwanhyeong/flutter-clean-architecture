import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/util/usecase.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

class LoginUseCase extends UseCase<User, LoginParams> {
  final UserRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Exception, User>> call(LoginParams params) async {
    return await repository.login(params.id, params.password);
  }
}

class LoginParams extends Equatable {
  final String id;
  final String password;

  const LoginParams(this.id, this.password);

  @override
  List<Object> get props => [id, password];
}
