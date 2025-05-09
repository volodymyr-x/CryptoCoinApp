import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency({
    required this.name,
    required this.fullName,
    required this.priceInUSD,
    required this.imageUrl,
  });

  final String name;
  final String fullName;
  final String priceInUSD;
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  @override
  List<Object?> get props => [name, fullName, priceInUSD, imageUrl];
}
