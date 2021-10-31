import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<Failure, User>> login(String id, String password) async {
    try {
      return Right(User(name: 'guest', age: 10));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
