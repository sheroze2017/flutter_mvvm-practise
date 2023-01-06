import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_flutter/utils/routes/routes_name.dart';

import '../resources/components/round_button.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: emailFocusNode,
                onFieldSubmitted: (val) {
                  Utils.FieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_rounded)),
              ),
              SizedBox(
                height: height * .1,
              ),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                        focusNode: passwordFocusNode,
                        obscureText: _obscurePassword.value,
                        obscuringCharacter: '*',
                        controller: _passwordcontroller,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock_open_outlined),
                        ));
                  }),
              SizedBox(
                height: height * 0.09,
              ),
              RoundButton(
                onPress: () {
                  if (_emailcontroller.text.isEmpty) {
                    Utils.flushbarErrorMessage('Enter Email', context);
                  } else if (_passwordcontroller.text.isEmpty) {
                    Utils.flushbarErrorMessage(
                        'Password Field is empty', context);
                  } else if (_passwordcontroller.text.length < 6) {
                    Utils.flushbarErrorMessage(
                        'Length must be more then 6', context);
                  }
                },
                title: 'Login',
              )
            ],
          ),
        ));
  }
}
