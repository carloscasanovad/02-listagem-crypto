import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:intl/intl.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/model/crypto_list_model.dart';
import '../../shared/providers/providers.dart';
import '../../shared/repositories/crypto_list_repository.dart';
import '../providers/providers.dart';
import 'chart_list_view_buttons.dart';

class CryptoDetailsBody extends ConsumerStatefulWidget {
  @override
  ConsumerState<CryptoDetailsBody> createState() => _CryptoDetailsBodyState();
}

class _CryptoDetailsBodyState extends ConsumerState<CryptoDetailsBody> {
  CryptoListRepository repository = CryptoListRepository();
  late Future<List<CryptoListModel>> cryptos;

  int chartIndex = 0;
  @override
  void initState() {
    cryptos = repository.getAllCryptos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formater = NumberFormat("#,##0.00", "pt");
    int chartIndex = ref.watch(chartIndexTappedProvider);
    String cryptoName = ref.watch(cryptoFilterProvider);
    return SingleChildScrollView(
      child: FutureBuilder(
        future: cryptos,
        builder: (BuildContext context,
            AsyncSnapshot<List<CryptoListModel>> snapshot) {
          if (snapshot.hasData) {
            CryptoListModel dataCrypto = snapshot.data!.firstWhere(
              (crypto) => crypto.shortName == cryptoName,
            );
            List points =
                dataCrypto.marketPriceUpnDown.values.toList()[chartIndex];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dataCrypto.fullName,
                            style: const TextStyle(
                              fontSize: 32,
                              color: kDefaultBlack,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: const Color(0x00ffffff),
                            radius: 30,
                            backgroundImage: AssetImage(dataCrypto.cryptoLogo),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dataCrypto.shortName,
                        style: const TextStyle(
                          fontSize: 17,
                          color: kDefaultGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'R\$ ${formater.format(dataCrypto.marketHistoryPrice.values.toList()[chartIndex])}',
                        style: const TextStyle(
                          fontSize: 32,
                          color: kDefaultBlack,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        child: LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                              show: false,
                            ),
                            backgroundColor: kDefaultBackgroundColor,
                            minX: 0,
                            minY: 0,
                            // maxX: 10,
                            // maxY: 15,
                            gridData: FlGridData(
                              show: true,
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: const Color(0xff37434d),
                                  strokeWidth: 1,
                                );
                              },
                              //Remove as linhas do eixo X e Y do gráfico
                              drawVerticalLine: false,
                              drawHorizontalLine: false,
                            ),
                            borderData: FlBorderData(
                              show: true,
                              // Cria a borda do gráfico
                              border: Border(
                                bottom: BorderSide(
                                    color: kDefaultGrey.withOpacity(0.3)),
                              ),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                // Remove os pontos do gráfico
                                dotData: FlDotData(
                                  show: false,
                                ),
                                spots: points
                                    .map((point) => FlSpot(point[0], point[1]))
                                    .toList(),
                                isCurved: false,
                                barWidth: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ChartListViewButtons(),
                      ListTile(
                        title: const Text('Preço atual'),
                        trailing: Text(
                            'R\$ ${formater.format(dataCrypto.marketHistoryPrice.values.toList()[chartIndex])}'),
                      ),
                      ListTile(
                        title: const Text('Variação do dia'),
                        trailing: Text(
                            ' ${(dataCrypto.percentVariation.values.toList()[chartIndex]).toStringAsFixed(2)}%'),
                      ),
                      ListTile(
                        title: const Text('Quantidade'),
                        trailing: Text(
                            '${(Decimal.parse(dataCrypto.userBalance.toString()) * dataCrypto.exchange).toStringAsFixed(2)} ${dataCrypto.shortName}'),
                      ),
                      ListTile(
                        title: const Text('Valor'),
                        trailing: Text(
                            'R\$ ${formater.format(dataCrypto.userBalance)}'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
