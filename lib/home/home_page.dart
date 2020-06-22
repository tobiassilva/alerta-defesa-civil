
import 'package:alertadefesacivil/globals.dart';
import 'package:alertadefesacivil/home/home_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    HomeWidget homeWidget = HomeWidget(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: StyleGlobals().primaryColor,
        body: homeWidget.HomeWidgetPrincipal(),
      ),
    );
  }
}
