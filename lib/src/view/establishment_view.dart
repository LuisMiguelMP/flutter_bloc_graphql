import 'package:flutter/material.dart';
import 'package:blapp/src/control/home_bloc.dart';
import 'package:blapp/src/model/estabelecimento_model.dart';
import 'package:blapp/src/state/state_page.dart';
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
        title: Text("Estabelecimentos parceiros"),
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
                    backgroundImage: AssetImage(estabelecimento.icone),
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
                  subtitle: Text(estabelecimento.localizacao),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => null));
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
