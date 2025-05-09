import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: routes,
      navigatorObservers: [TalkerRouteObserver(GetIt.I<Talker>())],
    );
  }
}