import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bottom_navigation_icons.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currency = NumberFormat("#,##0.00", "en_US");
  double userBalance = 1000;
  int _selectedIndex = 1;
  bool _visibility = true;
  String validateProfit(double profitability) {
    if (profitability >= 0) {
      return '+${profitability.toString()}%';
    }
    return '${profitability.toString()}%';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Carteira',
                        style: kTitleTextStyle,
                      ),
                      IconButton(
                        onPressed: () {
                          _visibility = !_visibility;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_rounded,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        "US\$ ",
                        style: kTitleTextStyle,
                      ),
                      ImageFiltered(
                        imageFilter: _visibility
                            ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
                            : ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Text(
                          currency.format(userBalance),
                          style: kTitleTextStyle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cryptos.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> crypto = cryptos[index];

                  return Card(
                    child: ListTile(
                      title: Text(
                        '${crypto['shortName']}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        '${crypto['fullName']}',
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0x00ffffff),
                        radius: 20,
                        backgroundImage: AssetImage('${crypto['cryptoLogo']}'),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageFiltered(
                            imageFilter: _visibility
                                ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
                                : ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                            child: const Text(
                              'US\$ 0,00',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            width: 62,
                            height: 20,
                            decoration: BoxDecoration(
                              color: crypto['profitability'] >= 0
                                  ? const Color(0xFFA0F4E0)
                                  : const Color(0xFFF7A1A1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                validateProfit(
                                    crypto['profitability'].toDouble()),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: crypto['profitability'] >= 0
                                      ? const Color(0xFF0C5F2C)
                                      : const Color(0xFF9A1414),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              BottomNavigationIcons.warren,
              size: 22,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BottomNavigationIcons.wallet,
              size: 22,
            ),
            label: 'Carteiras',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BottomNavigationIcons.balance,
              size: 22,
            ),
            label: 'Movimentações',
          ),
        ],
      ),
    );
  }
}
