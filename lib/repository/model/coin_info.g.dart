// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinInfo _$CoinInfoFromJson(Map<String, dynamic> json) => CoinInfo(
      name: json['Name'] as String,
      fullName: json['FullName'] as String,
      imageUrl: json['ImageUrl'] as String,
    );

Map<String, dynamic> _$CoinInfoToJson(CoinInfo instance) => <String, dynamic>{
      'Name': instance.name,
      'FullName': instance.fullName,
      'ImageUrl': instance.imageUrl,
    };
