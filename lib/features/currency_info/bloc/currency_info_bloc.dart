import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/currency_list/bloc/currency_list_bloc.dart';
import 'package:flutter_application_1/repository/currency_repository.dart';
import 'package:flutter_application_1/repository/model/currency.dart';
import 'package:flutter_application_1/repository/model/currency_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_item_state.dart';
part 'currency_item_event.dart';

class CurrencyItemBloc extends Bloc<CurrencyInfoEvent, CurrencyInfoState> {
  final CurrencyRepository currencyRepository;

  CurrencyItemBloc(this.currencyRepository) : super(const CurrencyListInitial()) {
    on<CurrencyInfoEvent>((event, emit) async {
      try {
        if (state is! CurrencyListLoaded) {
          emit(const CurrencyInfoLoading());          
        }
        if(event is LoadCurrencyInfo) {
          final currencyInfo = await currencyRepository.getCurrencyInfo(event.currency);
        emit(CurrencyInfoLoaded(currency: currencyInfo));
        }        
      } catch (e) {
        emit(CurrencyInfoLoadingFailure(exception: e));
      }
    });
  }
}