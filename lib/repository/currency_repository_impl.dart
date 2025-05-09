import 'package:dio/dio.dart';
import 'package:flutter_application_1/repository/currency_repository.dart';
import 'package:flutter_application_1/repository/model/currency_details.dart';
import 'package:flutter_application_1/repository/model/currency_info.dart';
import 'package:flutter_application_1/repository/model/currency_response.dart';

import 'model/currency.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final Dio dio;

  CurrencyRepositoryImpl({required this.dio});

  @override
  Future<List<Currency>> getCurrencyList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/top/totalvolfull?limit=100&tsym=USD');

    final currencyResponse = CurrencyResponse.fromJson(response.data);
    final curencyList = currencyResponse.currencyDataList.map((currencyData) {
      return Currency(
        name: currencyData.coinInfo.name,
        fullName: currencyData.coinInfo.fullName,
        imageUrl: currencyData.coinInfo.imageUrl,
        priceInUSD: currencyData.currencyDisplay?.currencyUsd.price ?? '---',
      );
    }).toList();
    return curencyList;
  }

  @override
  Future<CurrencyInfo> getCurrencyInfo(Currency currency) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=${currency.name}&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final currencyData = dataRaw[currency.name] as Map<String, dynamic>;
    final usdData = currencyData['USD'] as Map<String, dynamic>;
    final currencyDetails = CurrencyDetails.fromJson(usdData);
    return CurrencyInfo(
      name: currency.name,
      fullName: currency.fullName,
      details: currencyDetails,
    );
  }
}
