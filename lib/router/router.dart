import 'package:flutter_application_1/features/currency_info/view/currency_info.dart';
import 'package:flutter_application_1/features/currency_list/view/currency_list.dart';

final routes = {
        '/': (context) => const CurrencyListPage(),
        '/currency': (context) => const CurrencyInfoPage()
      };