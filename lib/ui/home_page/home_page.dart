import 'package:flutter/material.dart';

import '../../shared/widgets/bottom_navigation_bar.dart';
import 'widgets/home_page_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageWidget(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
