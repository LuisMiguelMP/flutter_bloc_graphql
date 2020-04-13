// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estabelecimento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstabelecimentoModel _$EstabelecimentoModelFromJson(Map<String, dynamic> json) {
  return EstabelecimentoModel(
    cnpj: json['cnpj'] as String,
    localizacao: json['localizacao'] as String,
    nome: json['nome'] as String,
    tipoEstabelecimento: json['tipoEstabelecimento'] as String,
    icone: json['icone'] as String,
    logradouro: json['logradouro'] as String,
  )..states = (json['states'] as List)
      ?.map((e) =>
          e == null ? null : StateModel.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$EstabelecimentoModelToJson(EstabelecimentoModel instance) =>
    <String, dynamic>{
      'cnpj': instance.cnpj,
      'localizacao': instance.localizacao,
      'nome':instance.nome,
      'tipoEstabelecimento':instance.tipoEstabelecimento,
      'icone' : instance.icone,
      'states': instance.states,
      'logradouro':instance.logradouro,
    };
