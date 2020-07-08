import 'package:alertadefesacivil/agente/solicitacoes/solicitacoes_functions.dart';
import 'package:alertadefesacivil/agente/solicitacoes/solicitacoes_widget.dart';
import 'package:alertadefesacivil/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SolicitacoesPage extends StatefulWidget {
  @override
  _SolicitacoesPageState createState() => _SolicitacoesPageState();
}

class _SolicitacoesPageState extends State<SolicitacoesPage> {

  bool _carregando = true;
  bool _leuBanco = false;

  SolicitacoesFunctions solicitacoesFunctions;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    solicitacoesFunctions = Provider.of<SolicitacoesFunctions>(context);

    if(!_leuBanco){
      _getDados();
      _leuBanco = true;
    }
  }

  void _getDados() async{
    bool carregou = await solicitacoesFunctions.getSolicitacoes();

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
    SolicitacoesWidget solicitacoesWidget = SolicitacoesWidget(context);
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
          child: solicitacoesWidget.solicitacoesWidgetPrincipal(),
        ),
      ),
    );
  }
}
