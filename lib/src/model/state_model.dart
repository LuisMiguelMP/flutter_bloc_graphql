import 'package:blapp/src/model/estabelecimento_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(name: 'cnpj')
  int stateId;

  @JsonKey(name: 'nome')
  String nome;
  String cnpj;
  String localizacao;
  String tipoEstabelecimento;
  String icone;
  String logradouro;

  @JsonKey(name: "estabelecimento")
  EstabelecimentoModel estabelecimento;

  StateModel({this.localizacao, this.nome, this.cnpj, this.icone, this.tipoEstabelecimento, this.logradouro});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
