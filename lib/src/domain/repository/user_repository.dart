import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../model/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(String id, String password);
}
