// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estabelecimento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstabelecimentoModel _$EstabelecimentoModelFromJson(Map<String, dynamic> json) {
  return EstabelecimentoModel(
    estabelecimentoId: json['estabelecimento_id'] as int,
    name: json['name'] as String,
  )..states = (json['states'] as List)
      ?.map((e) =>
          e == null ? null : StateModel.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$EstabelecimentoModelToJson(EstabelecimentoModel instance) =>
    <String, dynamic>{
      'estabelecimento_id': instance.estabelecimentoId,
      'name': instance.name,
      'states': instance.states,
    };
