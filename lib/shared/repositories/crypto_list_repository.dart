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
      profitability: 75,
      userBalance: 7996.5,
      exchange: 114577.93,
    ),
    CryptoListModel(
      shortName: 'ETH',
      fullName: 'Ethereum',
      cryptoLogo: ethLogo,
      profitability: 75,
      userBalance: 6557,
      exchange: 8960.35,
    ),
    CryptoListModel(
      shortName: 'LTC',
      fullName: 'Litecoin',
      cryptoLogo: ltcLogo,
      profitability: -0.7,
      userBalance: 1245.69,
      exchange: 318.57,
    ),
    CryptoListModel(
      shortName: 'DOGE',
      fullName: 'DogeCoin',
      cryptoLogo: dogeCoinLogo,
      profitability: -30,
      userBalance: 100,
      exchange: 3.22,
    ),
    CryptoListModel(
      shortName: 'ADA',
      fullName: 'Cardano',
      cryptoLogo: adaLogo,
      profitability: 10,
      userBalance: 940.55,
      exchange: 2.42,
    ),
    CryptoListModel(
      shortName: 'SOL',
      fullName: 'Solana',
      cryptoLogo: solanaLogo,
      profitability: -5.4,
      userBalance: 550,
      exchange: 180.19,
    ),
  ];
}
