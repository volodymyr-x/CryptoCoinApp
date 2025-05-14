import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_1/router/router.gr.dart';

import '../features/currency_info/view/currency_info.dart';
import '../features/currency_list/view/currency_list.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CurrencyListRoute.page, path: '/'),
    AutoRoute(page: CurrencyInfoRoute.page),
  ];
}
