import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repository/model/currency_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_response.g.dart';

@JsonSerializable()
class CurrencyResponse extends Equatable {
  const CurrencyResponse({
    required this.message,
    required this.currencyDataList,
  });

  @JsonKey(name: 'Message')
  final String message;

  @JsonKey(name: 'Data')
  final List<CurrencyData> currencyDataList;

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);

  @override
  List<Object?> get props => [message, currencyDataList];
}