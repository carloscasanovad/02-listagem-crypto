import 'package:flutter/material.dart';

const List<Map<String, dynamic>> cryptos = [
  {
    'shortName': 'ETH',
    'fullName': 'Ethereum',
    'cryptoLogo': 'assets/img/eth.jpg',
    'profitability': 75,
  },
  {
    'shortName': 'BTC',
    'fullName': 'Bitcoin',
    'cryptoLogo': 'assets/img/btc.jpg',
    'profitability': 75,
  },
  {
    'shortName': 'LTC',
    'fullName': 'Litecoin',
    'cryptoLogo': 'assets/img/ltc.jpg',
    'profitability': -0.7,
  },
];

const kTitleTextStyle = TextStyle(
  fontSize: 32,
  color: Color(0xff2F2F33),
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.bold,
);
