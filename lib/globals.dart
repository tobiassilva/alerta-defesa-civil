import 'package:alertadefesacivil/agente/home_agente/agente_page.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobx/mobx.dart';

class VarsGlobals {
  String linkApi = "http://8bf73015f331.ngrok.io";
}

class StyleGlobals {
  /// CORES DO APP
  var primaryColor = Colors.teal;
  var secundaryColor = Colors.white;
  var tertiaryColor = Color(0xFF2E2E2E); //Color(0xFF447DEB);

  /// CORES DE TEXTO
  var textColorForte = Color(0xFF1C1915);
  var textColorMedio = Color(0xFF797979);
  var textColorFraco = Color(0xFFB5B5B5);
  var textColorSecundary = Colors.white;
  var textColorTransparent = Colors.white70;

  var colorGradiente = LinearGradient(colors: [Colors.teal, Colors.tealAccent]);

  /// TAMANHO DE TEXTO
  var sizeTitulo = 24.0;
  var sizeTituloGrande = 44.0;
  var sizeText = 14.0;
  var sizeTextMedio = 16.0;
  var sizeSubtitulo = 18.0;
}

class WidgetsGlobals {
  Widget loading(corCarreg) {
    return SpinKitThreeBounce(
      color: corCarreg,
      size: StyleGlobals().sizeTitulo,
    );
  }
}

class FunctionsGlobals {
  Future<bool> verificaInternet() async {
    print('VENDO NET');
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }



  /// alert envio
  void alertConfEnvio(context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            content: Container(
              color: StyleGlobals().secundaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /*Image.asset(
                  "assets/images/icon_success.png",
                  fit: BoxFit.fitWidth,
                ),*/
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    "Dados Enviados com sucesso!",
                    style: TextStyle(color: StyleGlobals().textColorForte),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Container(
                decoration:
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: StyleGlobals().primaryColor,
                    ),
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => AgentePage()));
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(
                          color: StyleGlobals().textColorSecundary,
                          fontSize: 20),
                    )),
              ),
            ],
          );
        });
  }

  void alertErroForm(context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            content: Container(
              color: StyleGlobals().secundaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /*Image.asset(
                  "assets/images/icon_success.png",
                  fit: BoxFit.fitWidth,
                ),*/
                  Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    "Todos os campos precisam ser preenchidos",
                    style: TextStyle(color: StyleGlobals().textColorForte),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
                width: MediaQuery.of(context).size.width / 1.4,
                child: FlatButton(
                    color: Color(0XFF0e2a4e),
                    onPressed: () {
                      Navigator.pop(context);
                      /*Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));*/
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(
                          color: StyleGlobals().textColorSecundary,
                          fontSize: 20),
                    )),
              ),
            ],
          );
        });
  }


  void alertErroCarregamento(context) async {
    return showDialog<void>(
        context: context,
        builder: (_) {
          // return object of type Dialog
          return AlertDialog(
            content: Container(
              color: StyleGlobals().secundaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /*Image.asset(
                  "assets/images/icon_success.png",
                  fit: BoxFit.fitWidth,
                ),*/
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    "Erro na operação.\nTente novamente mais tarde.",
                    style: TextStyle(color: StyleGlobals().textColorForte),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Container(
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: StyleGlobals().primaryColor,
                ),
                width: MediaQuery.of(context).size.width,
                child: FlatButton(

                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      /*Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));*/
                    },
                    child: Text(
                      "Voltar",
                      style: TextStyle(
                          color: StyleGlobals().textColorSecundary,
                          fontSize: 20),
                    )),
              ),
            ],
          );
        });
  }


}

//Rodar MobX
//flutter packages pub run build_runner watch
