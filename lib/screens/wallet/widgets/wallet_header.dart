import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/crypto_list_repository.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/providers/providers.dart';

class WalletHeader extends ConsumerStatefulWidget {
  const WalletHeader({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletHeader> createState() => _WalletHeaderState();
}

class _WalletHeaderState extends ConsumerState<WalletHeader> {
  final formater = NumberFormat("#,##0.00", "pt");
  CryptoListRepository repository = CryptoListRepository();

  String walletBalance() {
    double wallet = 0;
    for (var crypto in repository.cryptoListRepository) {
      wallet += crypto.userBalance;
    }
    return formater.format(wallet);
  }

  @override
  Widget build(BuildContext context) {
    final bool visibility = ref.watch(visibilityProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Wrap(
                runSpacing: 10,
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
            ],
          ),
        ),
      ],
    );
  }
}
