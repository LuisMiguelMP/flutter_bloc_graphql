import 'package:blapp/src/model/state_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'estabelecimento_model.g.dart';

@JsonSerializable()
class EstabelecimentoModel {
  @JsonKey(name: 'estabelecimento_id')
  int estabelecimentoId;
  String name;
  List<StateModel> states;

  EstabelecimentoModel({
    this.estabelecimentoId,
    this.name
  });

  factory EstabelecimentoModel.fromJson(Map<String, dynamic> json) =>
      _$EstabelecimentoModelFromJson(json);
  Map<String, dynamic> toJson() => _$EstabelecimentoModelToJson(this);
}
