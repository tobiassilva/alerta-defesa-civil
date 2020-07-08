import 'package:alertadefesacivil/agente/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../globals.dart';
import '../login_functions.dart';

class SignUpWidget {

  BuildContext context;
  SignUpWidget(this.context);


  Widget signUpWidgetPrincipal() {

    final loginFunctions = Provider.of<LoginFunctions>(context);

    return Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/defensoria_grande.png',
                      ),
                      fit: BoxFit.cover,
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

            _botaoCriar(),

            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                    loginFunctions.gotoLogin();
                  },
                  child: Text(
                    'JÁ POSSUO CONTA',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: StyleGlobals().sizeText
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }

  Widget _formulario_widget() {

    final loginStore = Provider.of<LoginStore>(context);
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return Container(
      child: Column(
        children: <Widget>[

          ///NOME
          ///
          Container(
            height: 60,

            //color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(Radius.circular(30)),
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
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: StyleGlobals().sizeSubtitulo
                          ),
                          //keyboardType: TextInputType.,
                          controller: loginFunctions.nome,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite seu nome',
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
                    FontAwesomeIcons.at,
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
                          controller: loginFunctions.emailCria,
                          onChanged: loginStore.setCriaEmail,
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
                    FontAwesomeIcons.userLock,
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

                                //enabled: false,
                                controller: loginFunctions.senhaCria,
                                obscureText: true,
                                onChanged: loginStore.setCriaSenha,
                                textAlign: TextAlign.left,
                                enabled: !loginStore.carregando,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'crie uma senha',
                                  hintStyle: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          /// CAMPO CONFIRMA SENHA
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

                                //enabled: false,
                                controller: loginFunctions.senhaConfirma,
                                obscureText: true,
                                enabled: !loginStore.carregando,
                                onChanged: loginStore.setConfirmaSenha,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'confirme sua senha',
                                  hintStyle: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          /// CAMPO CPF
          Container(
            height: 60,

            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.all(Radius.circular(30)),
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
                    FontAwesomeIcons.solidIdCard,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          inputFormatters: [loginFunctions.maskTextCNPJ],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: StyleGlobals().sizeSubtitulo
                          ),
                          keyboardType: TextInputType.number,

                          //enabled: false,
                          controller: loginFunctions.cpf,
                          //obscureText: !loginStore.verSenha,
                          //onChanged: loginStore.setSenha,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'CPF',
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

          ///CARGO
          ///
          Container(
            height: 60,

            //color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(Radius.circular(30)),
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
                    FontAwesomeIcons.userTie,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
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
                          controller: loginFunctions.cargo,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite seu cargo',
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


        ],
      ),
    );
  }


  Widget _botaoCriar(){

    final loginStore = Provider.of<LoginStore>(context);
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () async {
        print('AAAAAAAAA');
        if(!loginStore.carregando){
          loginStore.setCarregando();
          if(loginStore.validaEmail(loginStore.criaEmail)){
            if(loginStore.criaSenha.length >= 8){
              if(loginStore.criaSenha == loginStore.confirmaSenha){
                //await loginFunctions.getNoticias();
                await loginFunctions.criaConta().then((value){
                  alertConfCadastro();
                }).catchError((e){
                  loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Erro ao criar conta :(')));
                });
              } else {
                loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('As senhas devem ser iguais')));
              }
            } else {
              loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Senha deve ter 8 caracteres ou mais')));
            }
          } else {
            loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Ops! Esse email não é válido')));
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
                        : Text('CRIAR CONTA',
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



  void alertConfCadastro() async {
    return showDialog<void>(
        context: context,
        builder: (_) {
          // return object of type Dialog
          return AlertDialog(
            content: Container(
              color: StyleGlobals().secundaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.8,
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
                    "Cadastro realizado com sucesso!",
                    style: TextStyle(color: StyleGlobals().textColorForte),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    "Aguarde aprovação do Administrador. Voce poderá logar em breve...",
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


}