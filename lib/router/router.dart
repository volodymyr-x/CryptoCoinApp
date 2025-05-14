import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_1/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CurrencyListRoute.page, path: '/'),
    AutoRoute(page: CurrencyInfoRoute.page),
  ];
}
