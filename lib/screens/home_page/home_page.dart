import 'package:flutter/material.dart';

import '../../shared/widgets/bottom_navigation_bar.dart';
import 'widgets/crypto_wallet.dart';
import 'widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Header(),
            CryptoWallet(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
