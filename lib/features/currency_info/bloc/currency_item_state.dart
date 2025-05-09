part of 'currency_info_bloc.dart';

sealed class CurrencyInfoState extends Equatable {
  const CurrencyInfoState();

  @override
  List<Object?> get props => [];
}

class CurrencyListInitial extends CurrencyInfoState {
  const CurrencyListInitial();
}

class CurrencyInfoLoading extends CurrencyInfoState {
  const CurrencyInfoLoading();
}

class CurrencyInfoLoaded extends CurrencyInfoState {
  const CurrencyInfoLoaded({ required this.currency });

  final CurrencyInfo currency;

  @override
  List<Object?> get props => [currency];
}

class CurrencyInfoLoadingFailure extends CurrencyInfoState {
  const CurrencyInfoLoadingFailure({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}