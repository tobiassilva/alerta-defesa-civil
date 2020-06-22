import 'package:alertadefesacivil/agente/login/login_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:alertadefesacivil/home/home_page.dart';

import 'agente/login/login_store.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginFunctions>(create: (_) => LoginFunctions(context),),
        Provider<LoginStore>(create: (_) => LoginStore(),),
      ],
        child: MaterialApp(
          title: 'Alerta Defesa Civil',

          home: HomePage(),
        ),
    );
  }
}

