import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;
  List<Map<String, String>> navBarIcons = [
    {"icon": 'assets/img/warren.png', "label": 'Home'},
    {"icon": 'assets/img/wallet.png', "label": "Carteiras"},
    {"icon": 'assets/img/balance.png', "label": "Movimentações"}
  ];
  List<BottomNavigationBarItem> buildNavBarItems() {
    List<BottomNavigationBarItem> navBarItems = [];
    for (var navBarIcon in navBarIcons) {
      navBarItems.add(
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('${navBarIcon['icon']}'),
            size: 22,
          ),
          label: navBarIcon['label'],
        ),
      );
    }
    return navBarItems;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: kNavBarSelectedIconColor,
      currentIndex: _selectedIndex,
      onTap: (index) {
        _selectedIndex = index;
        setState(() {});
      },
      items: buildNavBarItems(),
    );
  }
}
