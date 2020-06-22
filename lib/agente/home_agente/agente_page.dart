import 'package:alertadefesacivil/agente/home_agente/agente_widget.dart';
import 'package:flutter/material.dart';

class AgentePage extends StatefulWidget {
  @override
  _AgentePageState createState() => _AgentePageState();
}

class _AgentePageState extends State<AgentePage> {


  @override
  Widget build(BuildContext context) {
    AgenteWidget agenteWidget = AgenteWidget(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: agenteWidget.agenteWidgetPrincipal(),
        ),
      ),
    );
  }
}
