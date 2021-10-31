import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<LoginScreenViewModel>().login('test1', '1234');
            },
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}
