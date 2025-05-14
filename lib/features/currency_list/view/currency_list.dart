import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/currency_list/bloc/currency_list_bloc.dart';
import 'package:flutter_application_1/features/currency_list/widget/currency_info.dart';
import 'package:flutter_application_1/repository/currency_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class CurrencyListPage extends StatefulWidget {
  const CurrencyListPage({super.key});

  @override
  State<CurrencyListPage> createState() => _CurrencyListPageState();
}

class _CurrencyListPageState extends State<CurrencyListPage> {
  final _currencyListBloc = CurrencyListBloc(GetIt.I<CurrencyRepository>());

  @override
  void initState() {
    loadCurrencyList();
    super.initState();
  }

  void loadCurrencyList([Completer? completer]) {
    _currencyListBloc.add(LoadCurrencyList(completer));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(child: Text('Currencies')),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        TalkerScreen(talker: GetIt.I<Talker>())));
              },
              icon: const Icon(Icons.document_scanner),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            loadCurrencyList(completer);
            completer.future;
          },
          child: BlocBuilder<CurrencyListBloc, CurrencyListState>(
            bloc: _currencyListBloc,
            builder: (context, state) {
              if (state is CurrencyListLoaded) {
                return ListView.separated(
                    itemCount: state.currencyList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final currency = state.currencyList[index];
                      return CurrencyItemView(currency: currency);
                    });
              } else if (state is CurrencyListError) {
                return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      const Text('Currency list loading error'),
                      TextButton(
                        child: const Text('try again'),
                        onPressed: () => loadCurrencyList(),
                      ),
                    ]));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
