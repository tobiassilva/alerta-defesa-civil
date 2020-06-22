import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


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

  var maskTextCNPJ = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});



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