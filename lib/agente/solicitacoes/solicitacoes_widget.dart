import 'package:alertadefesacivil/agente/solicitacoes/solicitacoes_functions.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SolicitacoesWidget {

  BuildContext context;
  SolicitacoesWidget(this.context);


  Widget solicitacoesWidgetPrincipal() {
    return Column(
      children: <Widget>[
        _barraTopo(),
        Expanded(
          child: _corpoPage(),
        ),
      ],
    );
  }


  Widget _barraTopo(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: StyleGlobals().primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(150),
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 18, top: 17),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: StyleGlobals().textColorSecundary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget _corpoPage(){
    final solicitacoesFunctions = Provider.of<SolicitacoesFunctions>(context);
    List listaSolicitacoes = solicitacoesFunctions.listaSolicitacoes;
    return Container(

      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              'Solicitações',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: StyleGlobals().sizeTituloGrande,
                color: StyleGlobals().textColorForte,

              ),
            ),
          ),

          SizedBox(
            height: 55,
          ),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listaSolicitacoes.length,
            itemBuilder: (_, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      alertSolicitacoes(
                          listaSolicitacoes[index]['name'],
                          listaSolicitacoes[index]['email'],
                          listaSolicitacoes[index]['job'],
                          listaSolicitacoes[index]['cpf'],
                          listaSolicitacoes[index]['created_at'],
                          listaSolicitacoes[index]['_id'],
                      );
                    },
                    child: Container(
                      //height: 120,
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 10),
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
                        color: StyleGlobals().secundaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20.0, // has the effect of softening the shadow
                            spreadRadius: 2.0, // has the effect of extending the shadow
                            offset: Offset(
                              10.0, // horizontal, move right 10
                              10.0, // vertical, move down 10
                            ),
                          )
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.fileAlt,
                            color: StyleGlobals().textColorForte,
                            size: 55,
                          ),

                          SizedBox(
                            width: 15,
                          ),

                          Expanded(
                            child: Column(
                              children: <Widget>[

                                /// NOME
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        '${listaSolicitacoes[index]['name']}',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: StyleGlobals().sizeTitulo,
                                          color: StyleGlobals().textColorForte,
                                        ),

                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 5,
                                ),

                                /// EMAIL
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        '${listaSolicitacoes[index]['email']}',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: StyleGlobals().sizeSubtitulo,
                                          color: StyleGlobals().textColorMedio,
                                        ),

                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Ver Mais ',
                                      style: TextStyle(
                                        color: StyleGlobals().primaryColor,
                                        fontSize: StyleGlobals().sizeTextMedio,
                                      ),
                                    ),
                                    Icon(
                                      FontAwesomeIcons.angleDoubleRight,
                                      color: StyleGlobals().primaryColor,
                                      size: StyleGlobals().sizeTextMedio,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }




  /// DIALOG
  /// VER SOLICITAÇÕES
  ///

  Future<bool> _onWillPop() {
    Navigator.of(context).pop(false);
    print("Teste");
  }

  void alertSolicitacoes(nome, email, job, cpf, dataCriacao, idUser) async {
    final solicitacoesFunctions = Provider.of<SolicitacoesFunctions>(context, listen: false);
    return showDialog<void>(
        context: context,
        builder: (_) {
          // return object of type Dialog
          return MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.transparent,
              body: WillPopScope(
                onWillPop: _onWillPop,
                child: Container(
                  margin: EdgeInsets.fromLTRB(35, 95, 35, 95),
                  padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(
                    color: StyleGlobals().primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[


                      /*Image.asset("assets/images/icon_success.png",
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),),*/


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text("$nome",
                              style: TextStyle(
                                color: StyleGlobals().textColorTransparent,
                                fontSize: StyleGlobals().sizeTitulo+3,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            /// EMAIL
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Email: ",
                                    style: TextStyle(
                                      color: StyleGlobals().textColorSecundary,
                                      fontSize: StyleGlobals().sizeTextMedio,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "$email",
                                      style: TextStyle(
                                        color: StyleGlobals().textColorSecundary,
                                        fontSize: StyleGlobals().sizeTextMedio,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            /// CPF
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "CPF: ",
                                    style: TextStyle(
                                      color: StyleGlobals().textColorSecundary,
                                      fontSize: StyleGlobals().sizeTextMedio,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "$cpf",
                                      style: TextStyle(
                                        color: StyleGlobals().textColorSecundary,
                                        fontSize: StyleGlobals().sizeTextMedio,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            /// JOB
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Cargo: ",
                                    style: TextStyle(
                                      color: StyleGlobals().textColorSecundary,
                                      fontSize: StyleGlobals().sizeTextMedio,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "$job",
                                      style: TextStyle(
                                        color: StyleGlobals().textColorSecundary,
                                        fontSize: StyleGlobals().sizeTextMedio,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            /// DATA
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Data Solicitação: ",
                                    style: TextStyle(
                                      color: StyleGlobals().textColorSecundary,
                                      fontSize: StyleGlobals().sizeTextMedio,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "$dataCriacao",
                                      style: TextStyle(
                                        color: StyleGlobals().textColorSecundary,
                                        fontSize: StyleGlobals().sizeTextMedio,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(


                            child: FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.angleDoubleLeft,
                                      color: StyleGlobals().textColorTransparent,
                                      size: StyleGlobals().sizeTextMedio,
                                    ),
                                    Text(
                                      " Voltar",
                                      style: TextStyle(
                                          color: StyleGlobals().textColorTransparent,
                                          fontSize: StyleGlobals().sizeTextMedio,
                                      ),
                                    ),
                                  ],
                                )),
                          ),

                          Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: StyleGlobals().secundaryColor,
                            ),

                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                                onPressed: () async {
                                  bool _enviou = await solicitacoesFunctions.aprovarUsuario(idUser);

                                  if(_enviou){
                                    FunctionsGlobals().alertConfEnvio(context);
                                  } else {
                                    FunctionsGlobals().alertErroCarregamento(context);
                                  }

                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                                  child: Text(
                                    "Aprovar",
                                    style: TextStyle(color: StyleGlobals().primaryColor, fontSize: StyleGlobals().sizeSubtitulo),
                                  ),
                                )),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 15,
                      ),

                    ],
                  ),
                ),

              ),
            ),
          );
        });
  }




}