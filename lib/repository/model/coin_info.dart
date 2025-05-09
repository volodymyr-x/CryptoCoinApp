import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_info.g.dart';

@JsonSerializable()
class CoinInfo extends Equatable {
  const CoinInfo ({
    required this.name,
    required this.fullName,
    required this.imageUrl,
  });

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'FullName')
  final String fullName;

  @JsonKey(name: 'ImageUrl')
  final String imageUrl;

factory CoinInfo.fromJson(Map<String, dynamic> json) =>
      _$CoinInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CoinInfoToJson(this);

  @override
  List<Object?> get props => [name, fullName, imageUrl];
  
}