import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constants/app_colors.dart';
import '../providers/asset_provider.dart';
import '../providers/providers.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = ref.watch(navBarIndexProvider);
    return BottomNavigationBar(
      selectedItemColor: kDefaultRed,
      currentIndex: selectedIndex,
      onTap: (index) {
        ref.read(navBarIndexProvider.notifier).state = index;
        index == 1
            ? Navigator.pushReplacementNamed(context, "/transactions")
            : Navigator.pushReplacementNamed(context, "/");
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
