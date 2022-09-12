import 'package:crypto/screens/wallet/widgets/wallet_cryptos.dart';
import 'package:crypto/screens/wallet/widgets/wallet_header.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/crypto_list_repository.dart';
import '../../shared/widgets/bottom_navigation_bar.dart';

class WalletPage extends ConsumerStatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletPage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<WalletPage> {
  CryptoListRepository repository = CryptoListRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            WalletHeader(),
            WalletCryptos(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
