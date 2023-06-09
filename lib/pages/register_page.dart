

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirifanet/pages/sigup.dart';


import 'log.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
    bool isLogin = true;
    @override
    Widget build(BuildContext context) => isLogin
      ? LoginWidget(onClickedSingUp: toggle)
     : SignUpWidget(onClickedSignIn: toggle,);
  void toggle() => setState(() => isLogin = !isLogin);
}
