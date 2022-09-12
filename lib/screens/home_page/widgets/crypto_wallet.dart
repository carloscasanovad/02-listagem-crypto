import 'dart:ui';

import 'package:crypto/data/crypto_list_repository.dart';
import 'package:crypto/model/crypto_list_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/providers/providers.dart';
import '../../../utils/constants.dart';

class CryptoWallet extends ConsumerStatefulWidget {
  const CryptoWallet({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CryptoWallet> createState() => _CryptoCardsState();
}

class _CryptoCardsState extends ConsumerState<CryptoWallet> {
  final currency = NumberFormat("#,##0.00", "pt");

  String currencyConverter(double balance, double exchange, String currency) {
    String cryptoExchange = '';
    cryptoExchange = '${(balance / exchange).toStringAsFixed(2)} $currency';
    return cryptoExchange;
  }

  @override
  Widget build(BuildContext context) {
    bool visibility = ref.watch(visibilityProvider);
    CryptoListRepository repository = CryptoListRepository();
    return Expanded(
      child: ListView.builder(
        itemCount: repository.cryptoListRepository.length,
        itemBuilder: (context, index) {
          CryptoListModel crypto = repository.cryptoListRepository[index];
          return Card(
            child: ListTile(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ImageFiltered(
                        imageFilter: visibility
                            ? ImageFilter.blur()
                            : ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Text(
                          'R\$ ${currency.format(crypto.userBalance)}',
                          style: kCryptoCardTrailingTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: 62,
                        height: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: ImageFiltered(
                            imageFilter: visibility
                                ? ImageFilter.blur()
                                : ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                            child: Text(
                              currencyConverter(
                                crypto.userBalance.toDouble(),
                                crypto.exchange.toDouble(),
                                crypto.shortName,
                              ),
                              style: kCryptoExchangeTrailingTextStyle,
                            ),
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
                        size: 15,
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
