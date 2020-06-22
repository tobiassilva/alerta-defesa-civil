import 'package:alertadefesacivil/agente/criarNotificacao/criarNotificacao_page.dart';
import 'package:alertadefesacivil/agente/login/login_page.dart';
import 'package:alertadefesacivil/agente/verNotificacao/verNotificacao.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgenteWidget {

  BuildContext context;
  AgenteWidget(this.context);

  Widget agenteWidgetPrincipal() {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'assets/images/city_pxb.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),

        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.3)
          ),
        ),

        Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _bemVindo(),
            Expanded(child: _botoesWidget()),
          ],
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage())
                );
              },
              child: Container(
                padding: EdgeInsets.all(18),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.arrow_back_ios,
                      color: StyleGlobals().textColorForte,
                      size: StyleGlobals().sizeSubtitulo,
                    ),
                    Text(
                      ' Sair',
                      style: TextStyle(
                        color: StyleGlobals().textColorForte,
                        fontSize: StyleGlobals().sizeSubtitulo,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),


      ],
    );
  }


  Widget _bemVindo(){
    return Container(
      height: MediaQuery.of(context).size.height/3,
      //width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: StyleGlobals().secundaryColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Olá',
                  style: TextStyle(
                      color: StyleGlobals().primaryColor,
                      fontSize: StyleGlobals().sizeTitulo
                  ),
                ),
                Text(
                  'Thais Silva',
                  style: TextStyle(
                    color: StyleGlobals().textColorForte,
                    fontSize: StyleGlobals().sizeTituloGrande,
                  ),
                  textAlign: TextAlign.center,
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _botoesWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(

                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => VerNotificacaoPage())
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          child: Text(
                            "VER NOTIFICAÇÕES",
                            style: TextStyle(
                              fontSize: 20,
                              color: StyleGlobals().primaryColor,
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              GestureDetector(

                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CriarNotificacaoPage())
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          child: Text(
                            "NOVA NOTIFICAÇÃO",
                            style: TextStyle(
                              fontSize: 20,
                              color: StyleGlobals().primaryColor,
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
