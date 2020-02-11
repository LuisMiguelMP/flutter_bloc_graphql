import 'package:blapp/src/model/state_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'estabelecimento_model.g.dart';

@JsonSerializable()
class EstabelecimentoModel {
  @JsonKey(name: 'nome')
  String localizacao;
  String cnpj;
  String nome;
  String tipoEstabelecimento;
  String icone;
  List<StateModel> states;

  EstabelecimentoModel({
    this.cnpj,
    this.localizacao,
    this.nome,
    this.tipoEstabelecimento,
    this.icone
  });

  factory EstabelecimentoModel.fromJson(Map<String, dynamic> json) =>
      _$EstabelecimentoModelFromJson(json);
  Map<String, dynamic> toJson() => _$EstabelecimentoModelToJson(this);
}
