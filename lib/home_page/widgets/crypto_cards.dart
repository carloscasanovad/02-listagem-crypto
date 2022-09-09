import 'dart:ui';

import 'package:crypto/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../cryptos/cryptos.dart';
import '../../utils/providers/providers.dart';

class CryptoCards extends ConsumerStatefulWidget {
  const CryptoCards({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CryptoCards> createState() => _CryptoCardsState();
}

class _CryptoCardsState extends ConsumerState<CryptoCards> {
  String validateProfit(double profitability) {
    if (profitability >= 0) {
      return '+${profitability.toStringAsFixed(0)}%';
    }
    return '${profitability.toString()}%';
  }

  @override
  Widget build(BuildContext context) {
    bool visibility = ref.watch(visibilityProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: cryptos.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> crypto = cryptos[index];
          return Card(
            child: ListTile(
              title: Text(
                '${crypto['shortName']}',
                style: kCryptoCardTitleStyle,
              ),
              subtitle: Text(
                '${crypto['fullName']}',
                style: kCryptoCardSubtitleStyle,
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
                    imageFilter: visibility
                        ? ImageFilter.blur()
                        : ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: const Text(
                      'US\$ 0,00',
                      style: kCryptoCardTrailingTextStyle,
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
                        validateProfit(crypto['profitability'].toDouble()),
                        style: TextStyle(
                          fontSize: 12.5,
                          fontFamily: 'SourceSansPro-Light',
                          fontWeight: FontWeight.w700,
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
    );
  }
}
