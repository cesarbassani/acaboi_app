import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AcaBOI'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text('Login'),
          TextFormField(),
          const SizedBox(height: 10),
          const Text('Senha'),
          TextFormField(
            obscureText: true,
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text('Login')),
        ],
      ),
    );
  }
}
