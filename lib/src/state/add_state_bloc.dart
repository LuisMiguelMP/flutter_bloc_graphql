import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:blapp/src/control/home_module.dart';
import 'package:blapp/src/model/estabelecimento_model.dart';
import 'package:blapp/src/model/state_model.dart';
import 'package:blapp/src/state/state_repository.dart';

class AddStateBloc extends BlocBase {
  var controllerName = TextEditingController();
  var _repository = HomeModule.to.getDependency<StateRepository>();

  EstabelecimentoModel _estabelecimento;

  void setEstabelecimento(EstabelecimentoModel value) => _estabelecimento = value;

  Future<StateModel> create() async {
    var state = await _repository.createState(
        StateModel(name: controllerName.text, estabelecimentoId: _estabelecimento.estabelecimentoId));
    controllerName.clear();
    return state;
  }

  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }
}
