import 'package:blapp/src/model/state_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'estabelecimento_model.g.dart';

@JsonSerializable()
class EstabelecimentoModel {
  @JsonKey(name: 'cnpj')
  String localizacao;
  String cnpj;
  String nome;
  String tipoEstabelecimento;
  String icone;
  String logradouro;
  List<StateModel> states;

  EstabelecimentoModel({
    this.cnpj,
    this.localizacao,
    this.nome,
    this.tipoEstabelecimento,
    this.icone,
    this.logradouro
  });

  factory EstabelecimentoModel.fromJson(Map<String, dynamic> json) =>
      _$EstabelecimentoModelFromJson(json);
  Map<String, dynamic> toJson() => _$EstabelecimentoModelToJson(this);
}
