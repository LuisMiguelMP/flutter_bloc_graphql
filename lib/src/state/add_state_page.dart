import 'package:flutter/material.dart';
import 'package:blapp/src/control/home_module.dart';
import 'package:blapp/src/model/estabelecimento_model.dart';
import 'package:blapp/src/state/add_state_bloc.dart';

class AddStatePage extends StatefulWidget {
  final EstabelecimentoModel estabelecimento;  

  AddStatePage(this.estabelecimento);
  @override
  _AddStatePageState createState() => _AddStatePageState();
}

class _AddStatePageState extends State<AddStatePage> {
  var _bloc = HomeModule.to.getBloc<AddStateBloc>();

  @override
  void initState() {
    _bloc.setEstabelecimento(widget.estabelecimento);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddState"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Name"),
              controller: _bloc.controllerName,
            ),
            RaisedButton(
                child: Text("Save"),
                onPressed: () async {
                  var state = await _bloc.create();                                  
                  Navigator.pop(context, state);
                })
          ],
        ),
      ),
    );
  }
}
