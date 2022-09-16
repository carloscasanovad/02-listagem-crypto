import 'package:crypto/wallet/views/wallet_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/bottom_nav_bar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WalletScreen(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
