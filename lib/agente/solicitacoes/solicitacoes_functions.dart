import 'package:alertadefesacivil/globals.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SolicitacoesFunctions {

  BuildContext context;
  SolicitacoesFunctions(this.context);

  List listaSolicitacoes = List();

  Future<bool> getSolicitacoes() async {
    listaSolicitacoes.clear();

    final String http1 = '${VarsGlobals().linkApi}/toAprove';

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
      listaSolicitacoes.addAll(response.data['users']);

      return true;
    } else {
      return false;
    }
  }


  Future<bool> aprovarUsuario(idUser) async {
    final String http1 = '${VarsGlobals().linkApi}/user/$idUser';

    var dio = Dio();
    var response;
    try{
      response = await dio.put(http1, data: {
        'approved': true,
      });

      /*response = await dio.put(http1, data: {
        'id': idUser,
      });*/
      print('FOI');
      print('FOI: ${response}');
      print(response.statusCode);
      print(response.data);


      if(response.statusCode == 200){
        FunctionsGlobals().alertConfEnvio(context);
        return true;
      } else {
        Navigator.of(context).pop();
        FunctionsGlobals().alertErroCarregamento(context);
        return false;
      }
    } catch(e){
      print('DEU ERRO');
      Navigator.of(context).pop();
      FunctionsGlobals().alertErroCarregamento(context);
      return false;
    }
  }





}