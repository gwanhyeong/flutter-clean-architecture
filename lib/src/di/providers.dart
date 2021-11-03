import 'package:provider/provider.dart';

import '../data/repository/user_repository_impl.dart';
import '../domain/repository/user_repository.dart';
import '../domain/usecase/login.dart';
import '../domain/usecase/logout.dart';
import '../presentation/login/usecase.dart';
import '../presentation/login/view_model.dart';

final globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

final independentModels = [
  Provider<UserRepository>(
    create: (_) => UserRepositoryImpl(),
  ),
];

final dependentModels = [
  ProxyProvider<UserRepository, LoginScreenUseCase>(
    update: (context, repository, _) => LoginScreenUseCase(
      login: LoginUseCase(repository),
      logout: LogoutUseCase(repository),
    ),
  )
];

final viewModels = [
  ChangeNotifierProvider<LoginScreenViewModel>(
    create: (context) => LoginScreenViewModel(
      context.read<LoginScreenUseCase>(),
    ),
  ),
];
