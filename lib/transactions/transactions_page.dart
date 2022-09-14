import 'package:crypto/shared/constants/app_colors.dart';
import 'package:crypto/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
          child: Text(
            "Movimentações",
            style: kWalletBalanceTextStyle,
          ),
        ),
      ),
    );
  }
}
