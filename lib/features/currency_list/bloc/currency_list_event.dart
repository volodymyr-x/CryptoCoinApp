part of 'currency_list_bloc.dart';

sealed class CurrencyListEvent extends Equatable {
  const CurrencyListEvent(this.completer);
  final Completer? completer;
}

class LoadCurrencyList extends CurrencyListEvent {
  const LoadCurrencyList(super.completer); 
  
  @override
  List<Object?> get props => [completer];
}