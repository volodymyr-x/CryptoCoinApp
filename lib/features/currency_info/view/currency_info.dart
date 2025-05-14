import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/currency_info/bloc/currency_info_bloc.dart';
import 'package:flutter_application_1/features/currency_info/features/base_card.dart';
import 'package:flutter_application_1/repository/currency_repository.dart';
import 'package:flutter_application_1/repository/model/currency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CurrencyInfoPage extends StatefulWidget {
  const CurrencyInfoPage({
    super.key,
    required this.currency,
  });

  final Currency currency;

  @override
  State<CurrencyInfoPage> createState() => _CurrencyInfoPageState();
}

class _CurrencyInfoPageState extends State<CurrencyInfoPage> {
  final _currencyItemBloc = CurrencyItemBloc(GetIt.I<CurrencyRepository>());

  @override
  void initState() {
    _currencyItemBloc.add(LoadCurrencyInfo(currency: widget.currency));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<CurrencyItemBloc, CurrencyInfoState>(
        bloc: _currencyItemBloc,
        builder: (context, state) {
          if (state is CurrencyInfoLoaded) {
            final currencyInfo = state.currency;
            var details = currencyInfo.details;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(details.fullImageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    currencyInfo.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BaseCard(
                    child: Center(
                      child: Text(
                        '${details.priceInUSD} \$',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  BaseCard(
                    child: Column(
                      children: [
                        _DataRow(
                          title: 'Hight 24 Hour',
                          value: '${details.hight24Hour} \$',
                        ),
                        const SizedBox(height: 6),
                        _DataRow(
                          title: 'Low 24 Hour',
                          value: '${details.low24Hours} \$',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        const SizedBox(width: 32),
        Flexible(
          child: Text(value),
        ),
      ],
    );
  }
}
