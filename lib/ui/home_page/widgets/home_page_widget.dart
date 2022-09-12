import 'package:flutter/material.dart';
import 'crypto_cards.dart';
import 'header.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          Header(),
          CryptoCards(),
        ],
      ),
    );
  }
}
