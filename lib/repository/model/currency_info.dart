import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repository/model/currency_details.dart';

class CurrencyInfo extends Equatable {
  const CurrencyInfo({
    required this.name,
    required this.fullName,
    required this.details,
  });

  final String name;
  final String fullName;
  final CurrencyDetails details;

  @override
  List<Object?> get props => [name, fullName, details];
}
