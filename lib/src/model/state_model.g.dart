// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) {
  return StateModel(
    nome: json['nome'] as String,
    localizacao: json['localizacao'] as String,
    logradouro: json['logradouro'] as String,
  )..cnpj = json['cnpj'] as String;
}

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'localizacao': instance.stateId,
      'cnpj': instance.cnpj,
      'nome': instance.nome,
      'logradouro':instance.logradouro,
    };
