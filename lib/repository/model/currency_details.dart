import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_details.g.dart';

@JsonSerializable()
class CurrencyDetails extends Equatable {
  const CurrencyDetails({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;

  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  factory CurrencyDetails.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDetailsToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;

  static DateTime _dateTimeFromJson(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds);

  @override
  List<Object> get props => [
        toSymbol,
        lastUpdate,
        hight24Hour,
        low24Hours,
        priceInUSD,
        imageUrl,
      ];
}
