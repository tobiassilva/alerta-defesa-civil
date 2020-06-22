import 'package:alertadefesacivil/agente/login/login_page.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidget {

  BuildContext context;
  HomeWidget(this.context);

  Widget HomeWidgetPrincipal(){
    return Container(
      child: Column(
        children: <Widget>[
          _capa(),
          _botoesEntrar(),
        ],
      ),
    );
  }

  Widget _capa(){
    return Container(
      height: MediaQuery.of(context).size.height/2.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: StyleGlobals().secundaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        child: Hero(
          tag: 'imgCapa',
          child: Image.asset(
            'assets/images/defensoria_grande.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _botoesEntrar(){
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage())
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    'AGENTE',
                    style: TextStyle(
                      color: StyleGlobals().primaryColor,
                      fontSize: 20,
                      //color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    'CIDADÃO',
                    style: TextStyle(
                      color: StyleGlobals().primaryColor,
                      fontSize: 20,
                      //color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}