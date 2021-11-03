import 'package:dartz/dartz.dart';

import '../model/user.dart';

abstract class UserRepository {
  Future<Either<Exception, User>> login(String id, String password);
  Future<Either<Exception, bool>> logout();
}
