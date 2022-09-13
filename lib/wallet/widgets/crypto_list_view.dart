import 'package:crypto/wallet/widgets/crypto_list_tile.dart';
import 'package:flutter/material.dart';
import '../../model/crypto_list_model.dart';
import '../../repositories/crypto_list_repository.dart';

class CryptoListView extends StatelessWidget {
  const CryptoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CryptoListRepository repository = CryptoListRepository();
    return Expanded(
      child: ListView.builder(
        itemCount: repository.cryptoListRepository.length,
        itemBuilder: (context, index) {
          CryptoListModel crypto = repository.cryptoListRepository[index];
          return Card(
            child: CryptoListTile(
              model: crypto,
            ),
          );
        },
      ),
    );
  }
}
