import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/currency_app.dart';
import 'package:flutter_application_1/repository/currency_repository.dart';
import 'package:flutter_application_1/repository/currency_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseData: false,
      ),
    ),
  );
  GetIt.I.registerSingleton(dio);
  GetIt.I.registerLazySingleton<CurrencyRepository>(
      () => CurrencyRepositoryImpl(dio: dio));

  Bloc.observer = TalkerBlocObserver(talker: talker);

  FlutterError.onError =
      (details) => talker.handle(details.exception, details.stack);
  runTalkerZonedGuarded(
      talker, () => runApp(CurrencyApp()), (error, stack) {});
}
