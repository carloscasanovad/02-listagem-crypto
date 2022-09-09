import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currency = NumberFormat("#,##0.00", "pt_BR");
  double userBalance = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Carteira',
                        style: kTitleTextStyle,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_red_eye_rounded,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'US\$ ${currency.format(userBalance)}',
                        style: kTitleTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cryptos.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> crypto = cryptos[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${crypto['shortName']}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        '${crypto['fullName']}',
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0x00ffffff),
                        radius: 20,
                        backgroundImage: AssetImage('${crypto['cryptoLogo']}'),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'US\$ 0,00',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            width: 62,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD6FFDF),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                '75%',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0C5F2C),
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
            )
          ],
        ),
      ),
    );
  }
}
