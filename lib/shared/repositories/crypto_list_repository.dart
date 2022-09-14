import 'package:decimal/decimal.dart';

import '../model/crypto_list_model.dart';
import '../providers/asset_provider.dart';

class CryptoListRepository {
  Future<List<CryptoListModel>> getAllCryptos() async {
    List<CryptoListModel> cryptos = [];

    await Future.delayed(const Duration(seconds: 1), () {
      cryptos = cryptoListRepository;
    });
    return cryptos;
  }

  List<CryptoListModel> cryptoListRepository = [
    CryptoListModel(
      shortName: 'BTC',
      fullName: 'Bitcoin',
      cryptoLogo: btcLogo,
      profitability: Decimal.parse('75'),
      userBalance: 7996.5,
      exchange: Decimal.parse('0.0000095'),
    ),
    CryptoListModel(
      shortName: 'ETH',
      fullName: 'Ethereum',
      cryptoLogo: ethLogo,
      profitability: Decimal.parse('25'),
      userBalance: 6557,
      exchange: Decimal.parse('0.00012'),
    ),
    CryptoListModel(
      shortName: 'LTC',
      fullName: 'Litecoin',
      cryptoLogo: ltcLogo,
      profitability: Decimal.parse('-0.7'),
      userBalance: 1245.69,
      exchange: Decimal.parse('0.0032'),
    ),
    CryptoListModel(
      shortName: 'DOGE',
      fullName: 'DogeCoin',
      cryptoLogo: dogeCoinLogo,
      profitability: Decimal.parse('-30'),
      userBalance: 100,
      exchange: Decimal.parse('3.18'),
    ),
    CryptoListModel(
      shortName: 'ADA',
      fullName: 'Cardano',
      cryptoLogo: adaLogo,
      profitability: Decimal.parse('10'),
      userBalance: 940.55,
      exchange: Decimal.parse('0.40'),
    ),
    CryptoListModel(
      shortName: 'SOL',
      fullName: 'Solana',
      cryptoLogo: solanaLogo,
      profitability: Decimal.parse('-5.4'),
      userBalance: 550,
      exchange: Decimal.parse('0.0057'),
    ),
  ];
}
