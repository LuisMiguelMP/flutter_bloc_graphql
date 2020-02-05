import 'package:blapp/src/model/estabelecimento_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(name: 'state_id')
  int stateId;

  @JsonKey(name: 'estabelecimento_id')
  int estabelecimentoId;

  @JsonKey(name: "estabelecimento")
  EstabelecimentoModel estabelecimento;

  String name;

  StateModel({this.name, this.stateId, this.estabelecimentoId});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
