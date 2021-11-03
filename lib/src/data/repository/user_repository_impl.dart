import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<Exception, User>> login(String id, String password) async {
    try {
      if (id == 'test' && password == '1234') {
        return Right(User(id: id, name: 'guest', age: 10));
      } else {
        return Left(UnauthorisedException('일치하는 아이디가 없거나 비밀번호가 틀립니다.'));
      }
    } on Exception catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> logout() async {
    return const Right(true);
  }
}
