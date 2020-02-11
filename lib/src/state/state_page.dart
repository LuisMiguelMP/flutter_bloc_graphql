import 'package:flutter/material.dart';
import 'package:blapp/src/control/home_module.dart';
import 'package:blapp/src/model/estabelecimento_model.dart';
import 'package:blapp/src/model/state_model.dart';
import 'package:blapp/src/state/add_state_page.dart';
import 'package:blapp/src/state/state_bloc.dart';

class StatePage extends StatefulWidget {
  final EstabelecimentoModel estabelecimento;
  StatePage(this.estabelecimento);

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  var _bloc = HomeModule.to.getBloc<StateBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fidelização"),
      ),
      body: ListView.builder(
        itemCount: widget.estabelecimento.cnpj.length,
        itemBuilder: (context, index) {
          StateModel state = widget.estabelecimento.states[index];
          return Dismissible(
              key: Key(state.stateId.toString()),
              onDismissed: (direction) async {
                int affectedRows = await _bloc.remove(state.stateId);
                if (affectedRows > 0) widget.estabelecimento.states.remove(state);
              },
              child: ListTile(
                title: Text(state.nome),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var state = await Navigator.push<StateModel>(
              context,
              MaterialPageRoute(
                  builder: (context) => AddStatePage(widget.estabelecimento)));
          if (state != null) widget.estabelecimento.states.add(state);
        },
      ),
    );
  }
}
