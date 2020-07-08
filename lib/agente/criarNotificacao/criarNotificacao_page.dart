import 'package:alertadefesacivil/agente/criarNotificacao/criarNotificacao_widget.dart';
import 'package:flutter/material.dart';

class CriarNotificacaoPage extends StatefulWidget {
  @override
  _CriarNotificacaoPageState createState() => _CriarNotificacaoPageState();
}

class _CriarNotificacaoPageState extends State<CriarNotificacaoPage> {

  @override
  Widget build(BuildContext context) {
    CriarNotificacaoWidget criarNotificacaoWidget = CriarNotificacaoWidget(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: criarNotificacaoWidget.criarNotificacaoWidgetPrincipal(),
        ),
      ),
    );
  }
}
