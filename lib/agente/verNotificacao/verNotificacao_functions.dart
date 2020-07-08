import 'dart:convert';

import 'package:alertadefesacivil/globals.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerNotificacaoFunctions {

  BuildContext context;
  VerNotificacaoFunctions(this.context);

  List listaNotif = List();


  Future<bool> getNotificacoes() async {
    listaNotif.clear();
    final String http1 = '${VarsGlobals().linkApi}/notification';

    var dio = Dio();
    var response;
    try{
      response = await dio.get(http1);
    } catch(e){
      return false;
    }

    print(response.statusCode);
    print(response.data);

    if(response.statusCode == 200){
      listaNotif.addAll(response.data['docs']);

      return true;
    } else {
      return false;
    }
  }

}