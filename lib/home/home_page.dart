import 'package:alertadefesacivil/agente/login/login_page.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                  padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                  decoration: BoxDecoration(
                    color: StyleGlobals().primaryColor
                  ),
                  child: Text(
                    'Entrar como AGENTE',
                    style: TextStyle(color: StyleGlobals().textColorTransparent),
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
                  padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                  decoration: BoxDecoration(
                    color: StyleGlobals().primaryColor
                  ),
                  child: Text(
                    'Entrar como CIDADÃO',
                    style: TextStyle(color: StyleGlobals().textColorTransparent),
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
