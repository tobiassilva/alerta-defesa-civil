import 'package:alertadefesacivil/agente/home_agente/agente_page.dart';
import 'package:alertadefesacivil/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';



import '../../../globals.dart';
import '../login_functions.dart';
import '../login_store.dart';

class LoginWidget {

  BuildContext context;
  LoginWidget(this.context);


  Widget loginPrincipal() {
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //alignment: Alignment.center,
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                ),
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: 'imgCapa',
                    child: Image.asset(
                      'assets/images/defensoria_grande.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          _formulario_widget(),

          SizedBox(
            height: 40,
          ),

          _botaoLogar(),

          SizedBox(
            height: 40,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  loginFunctions.gotoSignUp();
                },
                child: Text(
                  'CRIAR CONTA',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: StyleGlobals().sizeText
                  ),
                ),
              ),

              FlatButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage())
                  );
                },
                child: Text(
                  'SAIR',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: StyleGlobals().sizeText
                  ),
                ),
              ),



            ],
          ),
        ],
      ),
    );
  }

  Widget _formulario_widget() {

    final loginStore = Provider.of<LoginStore>(context);
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return Container(
      child: Column(
        children: <Widget>[
          /// CAMPO EMAIL
          Container(
            height: 60,
            //color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: StyleGlobals().tertiaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(7))),
                  height: 60,
                  width: 43,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(
                    FontAwesomeIcons.userAlt,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          controller: loginFunctions.email,
                          onChanged: loginStore.setEmail,
                          textAlign: TextAlign.left,
                          enabled: !loginStore.carregando,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite seu email',
                            hintStyle: TextStyle(color: Colors.white70),
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

          /// CAMPO SENHA
          Container(
            height: 60,
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: StyleGlobals().tertiaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(7))),
                  height: 60,
                  width: 43,
                  //padding: EdgeInsets.only(left: 8, right: 8),
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(
                    FontAwesomeIcons.lock,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Observer(
                      builder: (_) {
                        return Row(
                          children: <Widget>[
                            Expanded(
                              child: new TextFormField(
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.visiblePassword,

                                enabled: !loginStore.carregando,
                                controller: loginFunctions.senhaLog,
                                obscureText: !loginStore.verSenha,
                                onChanged: loginStore.setSenha,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'digite sua senha',
                                  hintStyle: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                            IconButton(
                              //autofocus: false,
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                loginStore.verSenha ? Icons.visibility_off : Icons
                                    .visibility, color: Colors.white,),
                              onPressed: () {
                                loginStore.setVerSenha();
                              },
                            ),
                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _botaoLogar(){

    final loginStore = Provider.of<LoginStore>(context);
    final loginFunctions = Provider.of<LoginFunctions>(context);
    //final cadastroFunctions = Provider.of<CadastroFunctions>(context);

    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () async {
        print('AAAAAAAAA');
        /*Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
            builder: (context) => new AgentePage(),
            settings: RouteSettings(name: 'Agente Page'),
          ),
        );*/

        if(!loginStore.carregando){
          loginStore.setCarregando();
          if(loginStore.validaEmail(loginStore.email) || loginStore.senha.length > 0){

              await loginFunctions.login().then((value){

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AgentePage())
                );
              }).catchError((e){
                loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Usuário não encontrado :(')));
              });

          } else {
            loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Ops! email ou senha invalido')));
          }
          loginStore.setCarregando();
        }
        //loginStore.setCarregando();
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Observer(
              builder: (_){
                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: StyleGlobals().secundaryColor
                  ),
                  child: Center(
                    child: loginStore.carregando ?
                    SpinKitThreeBounce(
                      color: StyleGlobals().primaryColor,
                      size: StyleGlobals().sizeTitulo,
                    )
                        : Text('LOGIN',
                      style: TextStyle(
                          color: StyleGlobals().primaryColor,
                          fontSize: StyleGlobals().sizeSubtitulo
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}