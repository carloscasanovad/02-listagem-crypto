import 'package:crypto/transactions/transactions_page.dart';
import 'package:crypto/wallet/views/wallet_page.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../providers/asset_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          WalletPage(),
          TransactionsPage(),
        ],
        onPageChanged: (value) {
          _selectedIndex = value;
          setState(() {});
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kDefaultRed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          _pageController.animateToPage(
            index,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 500),
          );
          setState(() {});
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              warrenIcon,
              size: 22,
            ),
            label: 'Portfólio',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              cryptoCurrencyIcon,
              size: 24,
            ),
            label: 'Movimentações',
          ),
        ],
      ),
    );
  }
}
