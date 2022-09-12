import 'dart:ui';

import 'package:crypto/data/crypto_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/providers/providers.dart';
import '../../../utils/constants.dart';

class Header extends ConsumerStatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  ConsumerState<Header> createState() => _HeaderState();
}

String walletBalance() {
  final formater = NumberFormat("#,##0.00", "pt");
  CryptoListRepository repository = CryptoListRepository();
  double wallet = 0;
  for (var crypto in repository.cryptoListRepository) {
    wallet += crypto.userBalance;
  }
  return formater.format(wallet);
}

class _HeaderState extends ConsumerState<Header> {
  @override
  Widget build(BuildContext context) {
    final bool visibility = ref.watch(visibilityProvider);
    return Column(
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
                    'Carteira',
                    style: kTitleTextStyle,
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(visibilityProvider.notifier).state = !visibility;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.remove_red_eye_rounded,
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
                    style: kTitleTextStyle,
                  ),
                  ImageFiltered(
                    imageFilter: visibility
                        ? ImageFilter.blur()
                        : ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Text(
                      walletBalance(),
                      style: kTitleTextStyle,
                    ),
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
    );
  }
}
