import 'package:alertadefesacivil/agente/login/create/login_widget.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_functions.dart';
import 'create/signup_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SignUpWidget signUpWidget = SignUpWidget(context);
    LoginWidget loginWidget = LoginWidget(context);
    //final loginStore = Provider.of<LoginStore>(context);
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return Scaffold(
      key: loginFunctions.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: StyleGlobals().colorGradiente,
        ),
        child: new Container(
            height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: loginFunctions.controllerNavigation,
              physics: new AlwaysScrollableScrollPhysics(),
              children: <Widget>[signUpWidget.signUpWidgetPrincipal(), loginWidget.loginPrincipal()],
              scrollDirection: Axis.horizontal,
            )),
      ),
    );
  }
}
