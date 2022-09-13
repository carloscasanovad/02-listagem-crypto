import 'package:crypto/wallet/widgets/crypto_list_view.dart';
import 'package:crypto/wallet/widgets/header.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const <Widget>[
          Header(),
          CryptoListView(),
        ],
      ),
    );
  }
}
