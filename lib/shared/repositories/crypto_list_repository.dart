import '../model/crypto_list_model.dart';
import '../providers/asset_provider.dart';

class CryptoListRepository {
  List<CryptoListModel> cryptoListRepository = [
    CryptoListModel(
      shortName: 'BTC',
      fullName: 'Bitcoin',
      cryptoLogo: btcLogo,
      profitability: 75,
      userBalance: 7996,
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
      userBalance: 245,
      exchange: 318.07,
    ),
  ];
}
