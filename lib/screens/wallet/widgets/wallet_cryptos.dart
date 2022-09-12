import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/crypto_list_repository.dart';
import '../../../model/crypto_list_model.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/providers/providers.dart';

class WalletCryptos extends ConsumerStatefulWidget {
  const WalletCryptos({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletCryptos> createState() => _WalletCryptosState();
}

class _WalletCryptosState extends ConsumerState<WalletCryptos> {
  final formater = NumberFormat("#,##0.00", "pt");
  String currencyConverter(double balance, double exchange, String currency) {
    String cryptoExchange = '';
    cryptoExchange = '${(balance / exchange).toStringAsFixed(2)} $currency';
    return cryptoExchange;
  }

  @override
  Widget build(BuildContext context) {
    final bool visibility = ref.watch(visibilityProvider);
    CryptoListRepository repository = CryptoListRepository();
    return Expanded(
      child: ListView.builder(
        itemCount: repository.cryptoListRepository.length,
        itemBuilder: (context, index) {
          CryptoListModel crypto = repository.cryptoListRepository[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 15),
              title: Text(
                crypto.shortName,
                style: kCryptoCardTitleStyle,
              ),
              subtitle: Text(
                crypto.fullName,
                style: kCryptoCardSubtitleStyle,
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0x00ffffff),
                radius: 20,
                backgroundImage: AssetImage(crypto.cryptoLogo),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        visibility
                            ? 'R\$ ${formater.format(crypto.userBalance)}'
                            : 'R\$ $kDefaultHideValues',
                        style: kCryptoCardBalanceTrailingTextStyle,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 4),
                        width: 62,
                        height: 20,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            visibility
                                ? currencyConverter(
                                    crypto.userBalance.toDouble(),
                                    crypto.exchange.toDouble(),
                                    crypto.shortName,
                                  )
                                : "$kDefaultHideValues ${crypto.shortName}",
                            style: kCryptoCardExchangeTrailingTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 14.5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
