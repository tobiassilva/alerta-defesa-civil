import 'package:alertadefesacivil/agente/verNotificacao/verNotificacao_functions.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class VerNotificacaoWidget {

  BuildContext context;
  VerNotificacaoWidget(this.context);


  Widget verNotificacaoWidgetPrincipal(){
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
    final verNorificacaoFunctions = Provider.of<VerNotificacaoFunctions>(context);
    List listaNotif = verNorificacaoFunctions.listaNotif;
    return Container(

      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              'Notificações',
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
            itemCount: listaNotif.length,
            itemBuilder: (_, index){
              var data = listaNotif[index]['created_at'].split('T');

              DateFormat  f = new DateFormat('dd/MM/yyyy');
              DateFormat formatjson = new DateFormat('yyyy-MM-dd');

              var hora = data[1].split(':');
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      alertVerNotificacao(listaNotif[index]['title'], listaNotif[index]['description']);
                    },
                    child: Container(
                      height: 150,
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
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: Column(

                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '${listaNotif[index]['title']}',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: StyleGlobals().sizeTitulo,
                                                color: StyleGlobals().textColorForte,
                                              ),

                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              f.format(formatjson.parse(data[0])),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: StyleGlobals().sizeTextMedio,
                                                color: StyleGlobals().textColorMedio,
                                              ),

                                            ),
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '${int.parse(hora[0]) -3}',
                                                    style: TextStyle(
                                                      fontSize: StyleGlobals().sizeTextMedio,
                                                      color: StyleGlobals().textColorMedio,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ':',
                                                    style: TextStyle(
                                                      fontSize: StyleGlobals().sizeTextMedio,
                                                      color: StyleGlobals().textColorMedio,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: '${hora[1]}',
                                                    style: TextStyle(
                                                      fontSize: StyleGlobals().sizeTextMedio,
                                                      color: StyleGlobals().textColorMedio,
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
  /// VER NOTIFICAÇÕES
  ///

  Future<bool> _onWillPop() {
    Navigator.of(context).pop(false);
    print("Teste");
  }

  void alertVerNotificacao(titulo, descricao) async {
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
                  margin: EdgeInsets.fromLTRB(55, 95, 55, 95),
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
                            child: Text("$titulo",
                              style: TextStyle(
                                color: StyleGlobals().textColorTransparent,
                                fontSize: StyleGlobals().sizeTitulo,
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
                        child: ListView(
                          children: <Widget>[
                            Text(
                              "$descricao",
                              style: TextStyle(
                                color: StyleGlobals().textColorSecundary,
                                fontSize: StyleGlobals().sizeTextMedio,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(15, 3, 15, 3),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          color: StyleGlobals().secundaryColor,
                        ),

                        child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "VOLTAR",
                              style: TextStyle(color: StyleGlobals().textColorForte, fontSize: StyleGlobals().sizeSubtitulo),
                            )),
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