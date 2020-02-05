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
        title: Text("B)app => pontue, poupando papel (\$)"),
      ),
      
      body: 
      StreamBuilder<List<EstabelecimentoModel>>(
        stream: _bloc.outEstabelecimentos,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return ListView(
              children: snapshot.data.map((estabelecimento) {
            return ListTile(
              title: Text(estabelecimento.name),
              trailing: Icon(Icons.arrow_right),
              onTap: () {                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StatePage(estabelecimento)));
              },
              
            );
          }).toList());
        },
        
      ),
    );
    
  }
}
