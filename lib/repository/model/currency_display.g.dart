// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_display.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyDisplay _$CurrencyDisplayFromJson(Map<String, dynamic> json) =>
    CurrencyDisplay(
      currencyUsd: CurrencyUsd.fromJson(json['USD'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrencyDisplayToJson(CurrencyDisplay instance) =>
    <String, dynamic>{
      'USD': instance.currencyUsd,
    };
