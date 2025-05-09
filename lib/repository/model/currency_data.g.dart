// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyData _$CurrencyDataFromJson(Map<String, dynamic> json) => CurrencyData(
      coinInfo: CoinInfo.fromJson(json['CoinInfo'] as Map<String, dynamic>),
      currencyDisplay: json['DISPLAY'] == null
          ? null
          : CurrencyDisplay.fromJson(json['DISPLAY'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrencyDataToJson(CurrencyData instance) {
  final val = <String, dynamic>{
    'CoinInfo': instance.coinInfo,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DISPLAY', instance.currencyDisplay);
  return val;
}
