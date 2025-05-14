// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_application_1/features/currency_info/view/currency_info.dart'
    as _i1;
import 'package:flutter_application_1/features/currency_list/view/currency_list.dart'
    as _i2;
import 'package:flutter_application_1/repository/model/currency.dart' as _i5;

/// generated route for
/// [_i1.CurrencyInfoPage]
class CurrencyInfoRoute extends _i3.PageRouteInfo<CurrencyInfoRouteArgs> {
  CurrencyInfoRoute({
    _i4.Key? key,
    required _i5.Currency currency,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         CurrencyInfoRoute.name,
         args: CurrencyInfoRouteArgs(key: key, currency: currency),
         initialChildren: children,
       );

  static const String name = 'CurrencyInfoRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CurrencyInfoRouteArgs>();
      return _i1.CurrencyInfoPage(key: args.key, currency: args.currency);
    },
  );
}

class CurrencyInfoRouteArgs {
  const CurrencyInfoRouteArgs({this.key, required this.currency});

  final _i4.Key? key;

  final _i5.Currency currency;

  @override
  String toString() {
    return 'CurrencyInfoRouteArgs{key: $key, currency: $currency}';
  }
}

/// generated route for
/// [_i2.CurrencyListPage]
class CurrencyListRoute extends _i3.PageRouteInfo<void> {
  const CurrencyListRoute({List<_i3.PageRouteInfo>? children})
    : super(CurrencyListRoute.name, initialChildren: children);

  static const String name = 'CurrencyListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.CurrencyListPage();
    },
  );
}
