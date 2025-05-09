part of 'currency_info_bloc.dart';

sealed class CurrencyInfoEvent extends Equatable {
  const CurrencyInfoEvent();

  @override
  List<Object> get props => [];
}

class LoadCurrencyInfo extends CurrencyInfoEvent {
  const LoadCurrencyInfo({
    required this.currency,
  });

  final Currency currency;

  @override
  List<Object> get props => super.props..add(currency);
}
