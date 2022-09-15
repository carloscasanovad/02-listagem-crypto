import 'package:flutter/material.dart';

import 'package:crypto/shared/constants/app_colors.dart';
import 'package:crypto/shared/constants/app_text_styles.dart';

import 'crypto_details_body.dart';

class CryptoDetails extends StatelessWidget {
  String cryptoName;
  CryptoDetails({
    Key? key,
    required this.cryptoName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDefaultBackgroundColor,
        title: const Text(
          'Detalhes',
          style: kDetailsTitleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
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
