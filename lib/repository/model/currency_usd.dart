import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_usd.g.dart';

@JsonSerializable()
class CurrencyUsd extends Equatable {
const CurrencyUsd({
required this.price,
});

@JsonKey(name: 'PRICE')
final String price;

factory CurrencyUsd.fromJson(Map<String, dynamic> json) =>
      _$CurrencyUsdFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyUsdToJson(this);

  @override
  List<Object?> get props => [price];  
}