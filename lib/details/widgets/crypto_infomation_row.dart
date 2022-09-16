import 'package:crypto/shared/constants/app_colors.dart';
import 'package:crypto/shared/constants/app_text_styles.dart';
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
        Text(description, style: kDetailsCryptoInfoDescriptionStyle),
        Text(value, style: kDetailsCryptoInfoValueStyle),
      ],
    );
  }
}
