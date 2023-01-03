import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_flutter/utils/routes/routes_name.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: InkWell(
                  onTap: () {
                    Utils.snackBar('Connection done', context);
                    // Utils.toastMessage('No Internet Connection');
                    Navigator.pushNamed(context, RoutesName.home);
                  },
                  child: Text('click')))
        ],
      ),
    );
  }
}
