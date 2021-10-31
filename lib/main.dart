import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/data/repository/user_repository_impl.dart';
import 'src/domain/usecase/login.dart';
import 'src/presentation/login/view.dart';
import 'src/presentation/login/view_model.dart';

void main() {
  final userRepository = UserRepositoryImpl();
  runApp(
    Provider(
      create: (_) => LoginScreenViewModel(LoginUseCase(userRepository)),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
