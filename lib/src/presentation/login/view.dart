import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLoginButton(context),
            Text(viewModel.user?.name ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    final viewModel = context.watch<LoginScreenViewModel>();
    if (viewModel.user != null) {
      return ElevatedButton(
        onPressed: () {
          context.read<LoginScreenViewModel>().logout();
        },
        child: const Text('Logout'),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          context.read<LoginScreenViewModel>().login('test', '1234');
        },
        child: const Text('Login'),
      );
    }
  }
}
