import 'package:acaboi_app/app/widgets/app_button.dart';
import 'package:acaboi_app/app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

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
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            AppText(
              label: 'E-mail',
              hint: 'Digite o E-mail',
              keyboardType: TextInputType.emailAddress,
              controller: _tLogin,
              validator: _validateLogin,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            const SizedBox(height: 10),
            AppText(
              label: 'Senha',
              hint: 'Digite a senha',
              password: true,
              controller: _tSenha,
              validator: _validateSenha,
              focusNode: _focusSenha,
            ),
            const SizedBox(height: 10),
            AppButton(text: 'Login', onPressed: _onClickLogin),
          ],
        ),
      ),
    );
  }

  _appText({
    required String label,
    required String hint,
    password = false,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    FocusNode? nextFocus,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  _onClickLogin() {
    bool formOk = _formKey.currentState!.validate();
    if (!formOk) {
      return;
    }
    print('E-mail ${_tLogin.text}, Senha ${_tSenha.text}');
  }

  String? _validateLogin(String? value) {
    if (value!.isEmpty) {
      return 'Digite o E-mail';
    }
    return null;
  }

  String? _validateSenha(String? value) {
    if (value!.isEmpty) {
      return 'Digite a senha';
    }
    if (value.length < 6) {
      return 'A senha precisa ter pelo menos 6 caracteres';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
