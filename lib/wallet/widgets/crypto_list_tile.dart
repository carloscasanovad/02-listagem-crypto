import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/constants/app_text_styles.dart';
import '../../shared/model/crypto_list_model.dart';
import '../providers/providers.dart';

class CryptoListTile extends ConsumerStatefulWidget {
  CryptoListModel model;
  CryptoListTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  ConsumerState<CryptoListTile> createState() => _CryptoListTileState();
}

class _CryptoListTileState extends ConsumerState<CryptoListTile> {
  final formater = NumberFormat("#,##0.00", "pt");
  String currencyConverter(double balance, double exchange, String currency) {
    String cryptoExchange = '';
    cryptoExchange = '${(balance / exchange).toStringAsFixed(2)} $currency';
    return cryptoExchange;
  }

  @override
  Widget build(BuildContext context) {
    final bool visibility = ref.watch(visibilityProvider);
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 15),
      title: Text(
        widget.model.shortName,
        style: kCryptoCardTitleStyle,
      ),
      subtitle: Text(
        widget.model.fullName,
        style: kCryptoCardSubtitleStyle,
      ),
      leading: CircleAvatar(
        backgroundColor: const Color(0x00ffffff),
        radius: 20,
        backgroundImage: AssetImage(widget.model.cryptoLogo),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                visibility
                    ? 'R\$ ${formater.format(widget.model.userBalance)}'
                    : 'R\$ $kDefaultHideValues',
                style: kCryptoCardBalanceTrailingTextStyle,
              ),
              Container(
                padding: const EdgeInsets.only(top: 4),
                width: 80,
                height: 20,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    visibility
                        ? currencyConverter(
                            widget.model.userBalance.toDouble(),
                            widget.model.exchange.toDouble(),
                            widget.model.shortName,
                          )
                        : "$kDefaultHideValues ${widget.model.shortName}",
                    style: kCryptoCardExchangeTrailingTextStyle,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 14.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
