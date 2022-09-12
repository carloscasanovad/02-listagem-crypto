import '../model/crypto_list_model.dart';

class CryptoListRepository {
  List<CryptoListModel> cryptoListRepository = [
    CryptoListModel(
      shortName: 'BTC',
      fullName: 'Bitcoin',
      cryptoLogo: 'assets/img/btc.png',
      profitability: 75,
      userBalance: 7996,
    ),
    CryptoListModel(
      shortName: 'ETH',
      fullName: 'Ethereum',
      cryptoLogo: 'assets/img/eth.png',
      profitability: 75,
      userBalance: 6557,
    ),
    CryptoListModel(
      shortName: 'LTC',
      fullName: 'Litecoin',
      cryptoLogo: 'assets/img/ltc.png',
      profitability: -0.7,
      userBalance: 245,
    ),
  ];
}
