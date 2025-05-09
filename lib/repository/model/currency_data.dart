import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repository/model/coin_info.dart';
import 'package:flutter_application_1/repository/model/currency_display.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_data.g.dart';

@JsonSerializable()
class CurrencyData extends Equatable {
  const CurrencyData({
    required this.coinInfo,
    this.currencyDisplay,
  });

  @JsonKey(name: 'CoinInfo')
  final CoinInfo coinInfo;

  @JsonKey(name: 'DISPLAY', includeIfNull: false)
  final CurrencyDisplay? currencyDisplay;

factory CurrencyData.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDataFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDataToJson(this);

  @override
  List<Object?> get props => [coinInfo, currencyDisplay];
}
