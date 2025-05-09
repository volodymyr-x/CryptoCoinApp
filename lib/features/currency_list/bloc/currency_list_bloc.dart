import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repository/currency_repository.dart';
import 'package:flutter_application_1/repository/model/currency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'currency_list_state.dart';
part 'currency_list_event.dart';

class CurrencyListBloc extends Bloc<CurrencyListEvent, CurrencyListState> {
  final CurrencyRepository currencyRepository;

  CurrencyListBloc(this.currencyRepository) : super(CurrencyListInitial()) {
    on<CurrencyListEvent>((event, emit) async {
      try {
        if (state is! CurrencyListLoaded) {
          emit(CurrencyListLoading());          
        }
        final currencyList = await currencyRepository.getCurrencyList();
        emit(CurrencyListLoaded(currencyList: currencyList));
      } catch (e, st) {
        emit(CurrencyListError(exception: e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        if(event is LoadCurrencyList) {
          event.completer?.complete();
        }        
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {    
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
