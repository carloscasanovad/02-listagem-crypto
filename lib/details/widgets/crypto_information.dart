import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/model/crypto_list_model.dart';
import '../providers/providers.dart';
import 'crypto_infomation_row.dart';

class CryptoInformation extends HookConsumerWidget {
  CryptoInformation({
    Key? key,
    required this.dataCrypto,
  }) : super(key: key);

  final CryptoListModel dataCrypto;
  final formater = NumberFormat("#,##0.00", "pt");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int chartIndex = ref.watch(chartIndexTappedProvider);
    return Wrap(
      runSpacing: 15,
      children: [
        CryptoInformationRow(
          description: 'Preço atual',
          value:
              'R\$ ${formater.format(dataCrypto.marketHistoryPrice.values.toList()[chartIndex])}',
        ),
        CryptoInformationRow(
          description: 'Variação do dia',
          value:
              ' ${(dataCrypto.percentVariation.values.toList()[chartIndex]).toStringAsFixed(2)}%',
        ),
        CryptoInformationRow(
          description: 'Quantidade',
          value:
              '${(Decimal.parse(dataCrypto.userBalance.toString()) * dataCrypto.exchange).toStringAsFixed(2)} ${dataCrypto.shortName}',
        ),
        CryptoInformationRow(
          description: 'Valor',
          value: 'R\$ ${formater.format(dataCrypto.userBalance)}',
        ),
      ],
    );
  }
}
