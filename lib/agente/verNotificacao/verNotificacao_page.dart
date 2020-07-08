import 'package:alertadefesacivil/agente/verNotificacao/verNotificacao_functions.dart';
import 'package:alertadefesacivil/agente/verNotificacao/verNotificacao_widget.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerNotificacaoPage extends StatefulWidget {
  @override
  _VerNotificacaoState createState() => _VerNotificacaoState();
}

class _VerNotificacaoState extends State<VerNotificacaoPage> {

  bool _carregando = true;
  bool _leuBanco = false;

  VerNotificacaoFunctions verNotificacaoFunctions;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    verNotificacaoFunctions = Provider.of<VerNotificacaoFunctions>(context);

    if(!_leuBanco){
      _getDados();
      _leuBanco = true;
    }
  }

  void _getDados() async{
    bool carregou = await verNotificacaoFunctions.getNotificacoes();

    if(carregou){
      setState(() {
        _carregando = false;
      });
    } else {
      FunctionsGlobals().alertErroCarregamento(context);
    }


  }

  @override
  Widget build(BuildContext context) {
    VerNotificacaoWidget verNotificacaoWidget = VerNotificacaoWidget(context);
    return SafeArea(
      child: Scaffold(
        body: _carregando ?
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: StyleGlobals().colorGradiente,
          ),
            child: WidgetsGlobals().loading(StyleGlobals().secundaryColor),
        )
        : Container(
          width: MediaQuery.of(context).size.width,
          child: verNotificacaoWidget.verNotificacaoWidgetPrincipal(),
        ),
      ),
    );
  }
}
