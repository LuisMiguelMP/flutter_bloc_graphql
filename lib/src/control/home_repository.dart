import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:blapp/src/model/estabelecimento_model.dart';

class HomeRepository extends Disposable {
  final HasuraConnect connection;

  HomeRepository(this.connection);

  Future<List<EstabelecimentoModel>> getEstabelecimentos() async {
    String qry = """ 
    {
      estabelecimento{
        cnpj
        nome
        localizacao
        telefone
        tipoEstabelecimento
        icone
      }
    }
    """;
    var result = await connection.query(qry);
    var dynamics = result["data"]["estabelecimento"]
        .map((item) => EstabelecimentoModel.fromJson(item))
        .toList();

    var estabelecimento = List<EstabelecimentoModel>();
    for (var din in dynamics) {
      estabelecimento.add(din as EstabelecimentoModel);
    }
    return estabelecimento;
  }


  @override
  void dispose() {}
}
