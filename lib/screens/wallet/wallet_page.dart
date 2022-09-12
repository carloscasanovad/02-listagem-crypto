import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/crypto_list_repository.dart';
import '../../model/crypto_list_model.dart';
import '../../shared/providers/providers.dart';
import '../../shared/widgets/bottom_navigation_bar.dart';
import '../../shared/constants/constants.dart';

class WalletPage extends ConsumerStatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletPage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<WalletPage> {
  final formater = NumberFormat("#,##0.00", "pt");
  CryptoListRepository repository = CryptoListRepository();

  String walletBalance() {
    double wallet = 0;
    for (var crypto in repository.cryptoListRepository) {
      wallet += crypto.userBalance;
    }
    return formater.format(wallet);
  }

  String currencyConverter(double balance, double exchange, String currency) {
    String cryptoExchange = '';
    cryptoExchange = '${(balance / exchange).toStringAsFixed(2)} $currency';
    return cryptoExchange;
  }

  @override
  Widget build(BuildContext context) {
    final bool visibility = ref.watch(visibilityProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: kDefaultPadding,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cripto',
                            style: kTitleTextStyle,
                          ),
                          IconButton(
                            onPressed: () {
                              ref.read(visibilityProvider.notifier).state =
                                  !visibility;
                              setState(() {});
                            },
                            icon: Icon(
                              visibility
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                              size: 26,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "R\$ ",
                            style: kWalletBalanceTextStyle,
                          ),
                          Text(
                            visibility ? walletBalance() : kDefaultHideValues,
                            style: kWalletBalanceTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text(
                            "Valor total de moedas",
                            style: kSubtitleTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: repository.cryptoListRepository.length,
                itemBuilder: (context, index) {
                  CryptoListModel crypto =
                      repository.cryptoListRepository[index];
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                visibility
                                    ? 'R\$ ${formater.format(crypto.userBalance)}'
                                    : 'R\$ $kDefaultHideValues',
                                style: kCryptoCardTrailingTextStyle,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              SizedBox(
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
                                        : kDefaultHideValues,
                                    style: kCryptoExchangeTrailingTextStyle,
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
