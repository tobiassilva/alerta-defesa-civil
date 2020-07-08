import 'package:alertadefesacivil/agente/criarNotificacao/criarNotificacao_functions.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CriarNotificacaoWidget {

  BuildContext context;
  CriarNotificacaoWidget(this.context);

  Widget criarNotificacaoWidgetPrincipal(){
    return Column(
      children: <Widget>[
        _barraTopo(),
        Expanded(child: _formulario()),
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


  Widget _formulario(){
    final criarNotificacaoFunctions = Provider.of<CriarNotificacaoFunctions>(context);
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
      child: Column(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Flexible(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Descreva a ',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: StyleGlobals().textColorForte,
                        ),
                      ),
                      TextSpan(
                        text: 'Notificação',
                        style: TextStyle(
                          fontFamily: 'Swiss',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: StyleGlobals().primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),


          Expanded(
            child: ListView(
              children: <Widget>[

                SizedBox(
                  height: 60,
                ),


                ///TITULO
                ///
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 15, right: 10),
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    color: StyleGlobals().tertiaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: new TextFormField(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: StyleGlobals().sizeSubtitulo
                                ),
                                //keyboardType: TextInputType.,
                                controller: criarNotificacaoFunctions.titulo,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Titulo da Notificação',
                                  hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: StyleGlobals().sizeTextMedio
                                  ),
                                ),

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

                ///DESCRIÇÃO
                ///
                Container(
                  height: 200,

                  //color: Colors.white,
                  decoration: BoxDecoration(
                    color: StyleGlobals().tertiaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: <Widget>[

                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: new TextFormField(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: StyleGlobals().sizeSubtitulo
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 20,
                                  controller: criarNotificacaoFunctions.descricao,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'descrição...',
                                    hintStyle: TextStyle(
                                        color: Colors.white70,
                                        fontSize: StyleGlobals().sizeTextMedio
                                    ),
                                  ),

                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),

                _botaoEnviar(),

              ],
            ),
          ),


        ],
      ),
    );
  }


  Widget _botaoEnviar(){
    final criarNotificacaoFunctions = Provider.of<CriarNotificacaoFunctions>(context);
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () async {
        print('AAAAAAAAA');

        if(criarNotificacaoFunctions.titulo.text.isNotEmpty &&
            criarNotificacaoFunctions.descricao.text.isNotEmpty){
              await criarNotificacaoFunctions.enviarNotficacao().then((value){

              }).catchError((e){
                print('e: $e');
              });

              FunctionsGlobals().alertConfEnvio(context);

        } else {

          FunctionsGlobals().alertConfEnvio(context);
        }
        //loginStore.setCarregando();
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: StyleGlobals().primaryColor
              ),
              child: Center(
                child: Text('ENVIAR',
                  style: TextStyle(
                      color: StyleGlobals().textColorSecundary,
                      fontSize: StyleGlobals().sizeSubtitulo
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}