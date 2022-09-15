import 'package:decimal/decimal.dart';

class CryptoListModel {
  String shortName;
  String fullName;
  String cryptoLogo;
  Decimal profitability;
  double userBalance;
  double marketActualPrice;
  Map<String, double> percentVariation;
  Map<String, List<List<double>>> marketPriceVariation;
  Decimal exchange;
  CryptoListModel({
    required this.shortName,
    required this.fullName,
    required this.cryptoLogo,
    required this.profitability,
    required this.userBalance,
    required this.marketActualPrice,
    required this.percentVariation,
    required this.marketPriceVariation,
    required this.exchange,
  });

// 
  @override
  String toString() {
    return 'CryptoListModel(shortName: $shortName, fullName: $fullName, cryptoLogo: $cryptoLogo, profitability: $profitability, userBalance: $userBalance, marketActualPrice: $marketActualPrice, percentVariation: $percentVariation, marketPriceVariation: $marketPriceVariation, exchange: $exchange)';
  }
}
