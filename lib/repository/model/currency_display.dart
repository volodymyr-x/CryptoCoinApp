import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repository/model/currency_usd.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_display.g.dart';

@JsonSerializable(includeIfNull: false)
class CurrencyDisplay extends Equatable {
const CurrencyDisplay({
required this.currencyUsd,
});

@JsonKey(name: 'USD')
  final CurrencyUsd currencyUsd;

factory CurrencyDisplay.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDisplayFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDisplayToJson(this);

  @override
  List<Object?> get props => [currencyUsd];  
}