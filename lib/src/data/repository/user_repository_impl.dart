import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<Failure, User>> login(String id, String password) async {
    try {
      if (id == 'test' && password == '1234') {
        return Right(User(id: id, name: 'guest', age: 10));
      } else {
        return Left(ServerFailure('일치하는 아이디가 없거나 비밀번호가 틀립니다.'));
      }
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
