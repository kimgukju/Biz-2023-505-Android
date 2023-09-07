import 'package:firebase/modules/vaildate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextFormField 에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String _emailValue = "";
  String _passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("로그인")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputFormField(
                  focusNode: _emailFocus,
                  validator: (value) => CheckValidate()
                      .emailCheck(email: value!, focusNode: _emailFocus),
                  setValue: (value) => _emailValue = value,
                  hintText: "이메일",
                  helpText: "이메일을 형식에 맞게 입력해 주세요"),
              inputFormField(
                focusNode: _passwordFocus,
                hintText: "비밀번호",
                helpText: "비밀번호는 특수문자, 영문자, 숫자 포함 8자 이상으로 입력해주세요",
                setValue: (value) => _passwordValue = value,
                validator: (value) => CheckValidate().passwordCheck(
                  password: value!,
                  focusNode: _passwordFocus,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    _formKey.currentState?.validate();
                    var result =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: "callor@callor.com",
                      password: "!Korea8080",
                    );
                    setState(() {});
                  },
                  child: const Text("로그인"))
            ],
          ),
        ),
      ),
    );
  }

  // Widget 을 return 하는 method
  Widget inputFormField({
    required FocusNode focusNode,
    required Function(String) setValue,
    required Function(String?) validator,
    String? hintText,
    String? helpText,
  }) {
    return TextFormField(
      focusNode: focusNode,
      validator: (value) => validator(value),
      onChanged: (value) => setValue(value),
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helpText,
        helperStyle: const TextStyle(color: Colors.blue),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
