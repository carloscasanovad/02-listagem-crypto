import 'package:flutter/material.dart';

import '../../utils/constants.dart';

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
      selectedItemColor: Colors.red,
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
          label: 'Portfólio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/img/cryptocurrency.png'),
            size: 24,
          ),
          label: 'Movimentações',
        ),
      ],
    );
  }
}
