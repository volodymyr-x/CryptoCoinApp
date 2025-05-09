import 'package:flutter_application_1/repository/model/currency.dart';
import 'package:flutter_application_1/repository/model/currency_info.dart';

abstract interface class CurrencyRepository {
  Future<List<Currency>> getCurrencyList();
  Future<CurrencyInfo> getCurrencyInfo(Currency currency);
}