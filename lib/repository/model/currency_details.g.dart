// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyDetails _$CurrencyDetailsFromJson(Map<String, dynamic> json) =>
    CurrencyDetails(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: CurrencyDetails._dateTimeFromJson(
          (json['LASTUPDATE'] as num).toInt()),
      hight24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hours: (json['LOW24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrencyDetailsToJson(CurrencyDetails instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'LASTUPDATE': CurrencyDetails._dateTimeToJson(instance.lastUpdate),
      'HIGH24HOUR': instance.hight24Hour,
      'LOW24HOUR': instance.low24Hours,
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
    };
