import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: kNavBarSelectedIconColor,
      currentIndex: _selectedIndex,
      onTap: (index) {
        _selectedIndex = index;
        setState(() {});
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/img/warren.png'),
            size: 22,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/img/wallet.png'),
            size: 22,
          ),
          label: 'Carteiras',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/img/balance.png'),
            size: 22,
          ),
          label: 'Movimentações',
        ),
      ],
    );
  }
}
