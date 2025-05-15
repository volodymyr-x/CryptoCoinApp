import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/model/currency.dart';
import 'package:flutter_application_1/router/router.gr.dart';

class CurrencyListItem extends StatelessWidget {
  const CurrencyListItem({
    super.key,
    required this.currency,
      });  

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: Text(
        currency.name,
        style: textTheme.bodyLarge,
      ),
      subtitle: Text(
        '${currency.priceInUSD} \$',
        style: textTheme.bodyMedium,
      ),
      leading: Image.network(
        currency.fullImageUrl,
        width: 30,
        height: 30,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => {
        AutoRouter.of(context).push(
          CurrencyInfoRoute(currency: currency),
        )
      },
    );
  }
}
