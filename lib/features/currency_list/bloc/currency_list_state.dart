part of 'currency_list_bloc.dart';
// todo redo with sealed class
abstract class CurrencyListState extends Equatable {}

class CurrencyListInitial extends CurrencyListState {
  @override
  List<Object?> get props => [];
}

class CurrencyListLoading extends CurrencyListState {
  @override
  List<Object?> get props => [];
}

class CurrencyListLoaded extends CurrencyListState {
  final List<Currency> currencyList;

  CurrencyListLoaded({required this.currencyList});
  @override
  List<Object?> get props => [currencyList];

}

class CurrencyListError extends CurrencyListState {
  final Object exception;

  CurrencyListError({required this.exception});
  @override
  List<Object?> get props => [exception];

}
