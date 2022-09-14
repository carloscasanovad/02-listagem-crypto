import 'package:decimal/decimal.dart';

class CryptoListModel {
  String shortName;
  String fullName;
  String cryptoLogo;
  Decimal profitability;
  double userBalance;
  Decimal exchange;
  CryptoListModel({
    required this.shortName,
    required this.fullName,
    required this.cryptoLogo,
    required this.profitability,
    required this.userBalance,
    required this.exchange,
  });
}
