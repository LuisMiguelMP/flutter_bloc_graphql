import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:blapp/src/control/home_bloc.dart';
import 'package:blapp/src/model/estabelecimento_model.dart';
import 'package:blapp/src/view/map_view.dart';
import 'package:blapp/src/view/home_view.dart';
import '../control/home_module.dart';


class EstablishmentPage extends StatefulWidget {
  @override
  _EstablishmentPageState createState() => _EstablishmentPageState();
}

class _EstablishmentPageState extends State<EstablishmentPage> {
  var _bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    _bloc.getEstabelecimentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu),
            onPressed: () => scaffoldKey.currentState.openDrawer()),
                title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Estabelecimentos Parceiros",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            Text(
              "Selecione para visualizar no mapa",
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
          ],
        ),
        actions: <Widget>[new Padding(padding:const EdgeInsets.all(13.0), child:Icon(Icons.search))],
      ),
      body: StreamBuilder<List<EstabelecimentoModel>>(
        stream: _bloc.outEstabelecimentos,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView(
              children: snapshot.data.map((estabelecimento) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(13.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: MemoryImage(base64Decode(estabelecimento.icone)),
                  ),
                  title: Text(estabelecimento.nome),
                  trailing: Padding(
                    padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
                    child: Container(
                      width: 94,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(estabelecimento.tipoEstabelecimento,
                          textAlign: TextAlign.center),
                    ),
                  ),
                  subtitle: Text(estabelecimento.logradouro),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => setLocalizacao(estabelecimento.localizacao)));
                  },
                ),
              ),
            );
          }).toList());
        },
      ),
    );
  }
}
