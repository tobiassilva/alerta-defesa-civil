import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CriarNotificacaoFunctions {

  BuildContext context;
  CriarNotificacaoFunctions(this.context);

  //VARS FORM
  final titulo = TextEditingController();
  final descricao = TextEditingController();

  Future enviarNotficacao() async {
    print(titulo.text);
    print(descricao.text);


    final String http1 =
        '${VarsGlobals().linkApi}/notification';

    var dio = Dio();
    var response = await dio.post(http1, data: {
      'title':titulo.text,
      'description': descricao.text
    });

    print(response.statusCode);
    print('body: ${response.data}');
    print('response.data.toString(): ${response.data.toString()}');
    if(response.statusCode == 200){
      //deu ceerto
      titulo.text = '';
      descricao.text = '';
      FunctionsGlobals().alertConfEnvio(context);

    }

  }

}