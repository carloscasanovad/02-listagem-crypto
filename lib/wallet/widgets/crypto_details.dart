import 'package:flutter/material.dart';

import 'package:crypto/shared/constants/app_colors.dart';
import 'package:crypto/shared/constants/app_text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';
import 'crypto_details_body.dart';

class CryptoDetails extends HookConsumerWidget {
  String cryptoName;
  CryptoDetails({
    Key? key,
    required this.cryptoName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDefaultBackgroundColor,
        title: const Text(
          'Detalhes',
          style: kDetailsTitleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            ref.read(chartDayProvider.notifier).state = '5';
            ref.read(chartIndexTappedProvider.notifier).state = 0;
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDefaultBlack,
            size: 21,
          ),
        ),
      ),
      body: CryptoDetailsBody(
        cryptoName: cryptoName,
      ),
    );
  }
}
