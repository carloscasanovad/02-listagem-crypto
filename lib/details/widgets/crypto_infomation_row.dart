import 'package:flutter/material.dart';

class CryptoInformationRow extends StatelessWidget {
  const CryptoInformationRow({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);

  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(description),
        Text(value),
      ],
    );
  }
}
