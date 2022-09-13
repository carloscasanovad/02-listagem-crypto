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

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: kDefaultRed,
      currentIndex: _selectedIndex,
      onTap: (index) {
        _selectedIndex = index;
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
    );
  }
}
