import 'dart:convert';

import 'package:alertadefesacivil/agente/home_agente/agente_page.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../globals_agente.dart' as globalsAg;

import 'package:crypto/crypto.dart';
import 'package:crypto/src/digest_sink.dart';

class LoginFunctions {
  BuildContext context;

  LoginFunctions(this.context);

  //Variáveis
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  //Login
  final formKeyLogin = GlobalKey<FormState>();
  final email = TextEditingController();
  final senhaLog = TextEditingController();

  //Cria Conta
  final emailCria = TextEditingController();
  final senhaCria = TextEditingController();
  final senhaConfirma = TextEditingController();
  final cpf = TextEditingController();
  final nome = TextEditingController();
  final cargo = TextEditingController();

  var maskTextCNPJ = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});


  /// LOGIN
  ///
  ///
  Future<String> login() async {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text('Verificando....'),
    ));

    print(' loginnnn');

    print('EMAIL: ${email.text}');
    print(senhaLog.text);



    //var resultadoConexao = await FunctionsGlobals().verificaInternet();
    print(' NET');
    if (true) {
      print('TEM NET');

      final String http1 = '${VarsGlobals().linkApi}/login';

      var senhaCrip = utf8.encode(senhaLog.text);

      var ds = new DigestSink();
      var s = md5.startChunkedConversion(ds);

      s.add(senhaCrip);
      s.close();
      var digest = ds.value;

      print('senhaCrip: ');
      print(digest);

      var dio = Dio();



      var response = await dio.post(http1, data: {
        'email': email.text,
        'password': "$digest"
      });

      print('ENVIADO');
      print('status: ${response.statusCode}');
      print('body: ${response.data}');

      if (response.statusCode == 200) {
        print('achou status: ${response.data['user']}');

        globalsAg.nomeAg = response.data['user']['name'];
        globalsAg.cpfAg = response.data['user']['cpf'];
        globalsAg.cargoAg = response.data['user']['job'];
        globalsAg.emailAg = response.data['user']['email'];
        globalsAg.admin = response.data['user']['admin'];

        print('globalsAg.nomeAg: ${globalsAg.nomeAg}');
        print('globalsAg.cpfAg: ${globalsAg.cpfAg}');
        print('globalsAg.cargoAg: ${globalsAg.cargoAg}');
        print('globalsAg.emailAg: ${globalsAg.emailAg}');
        print('globalsAg.admin: ${globalsAg.admin}');

        email.clear();
        senhaLog.clear();


      }
    } else {
      print('NAO TEM NET');
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Você precisa de Internet!')));
    }

    return 'Sucesso';
  }

  /// CADASTRO
  ///
  Future criaConta() async {
    print(emailCria.text);
    print(senhaCria.text);
    print(senhaConfirma.text);
    print(cpf.text);
    print(nome.text);
    print(cargo.text);

    var senhaCrip = utf8.encode(senhaCria.text);
    var ds = new DigestSink();
    var s = md5.startChunkedConversion(ds);

    s.add(senhaCrip);
    s.close();
    var digest = ds.value;

    print('senhaCrip: ');
    print(digest);

    final String http1 = '${VarsGlobals().linkApi}/user';

    var dio = Dio();
    var response = await dio.post(http1, data: {
      'cpf': cpf.text,
      'job': cargo.text,
      'password': "$digest",
      'email': emailCria.text,
      'name': nome.text
    });

    print(response.statusCode);
    print('body: ${response.data}');
    print('response.data.toString(): ${response.data.toString()}');
    if (response.statusCode == 200) {
      //deu ceerto
      globalsAg.nomeAg = cpf.text;
      globalsAg.nomeAg = cargo.text;
      globalsAg.emailAg = emailCria.text;
      globalsAg.cpfAg = cpf.text;

      cpf.clear();
      cargo.clear();
      senhaCria.clear();
      senhaConfirma.clear();
      emailCria.clear();
      nome.clear();
    }
  }

  //NAVEGAÇÃO ENTRE AS PÁGINAS
  PageController controllerNavigation =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  gotoSignUp() {
    controllerNavigation.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoLogin() {
    controllerNavigation.animateToPage(
      1,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }
}
