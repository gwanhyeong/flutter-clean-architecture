import 'package:dartz/dartz.dart';

import '../../core/util/usecase.dart';
import '../repository/user_repository.dart';

class LogoutUseCase extends UseCase<bool, NoParams> {
  final UserRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Exception, bool>> call(NoParams params) async {
    return await repository.logout();
  }
}
