import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:blapp/src/control/home_module.dart';
import 'package:blapp/src/control/home_repository.dart';
import 'package:blapp/src/model/estabelecimento_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  var _repository = HomeModule.to.getDependency<HomeRepository>();
  

  Future<List<EstabelecimentoModel>> getEstabelecimentos() async {
    List<dynamic> estabelecimentos = await _repository.getEstabelecimentos();
    _estabelecimentosController.sink.add(estabelecimentos);
    return estabelecimentos;
  }

  var _estabelecimentosController = BehaviorSubject<List<EstabelecimentoModel>>();
  Observable<List<EstabelecimentoModel>> get outEstabelecimentos => _estabelecimentosController.stream;

  @override
  void dispose() {
    _estabelecimentosController.close();
    super.dispose();
  }
}
