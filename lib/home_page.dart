import 'package:coin_paprika/API/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Model/coins_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CoinsListModel> coinsList = [];

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('Fetching coins list...');
    }
    APIService.getCoinsList().then((value) {
      setState(() {
        coinsList = value;
      });
      if (kDebugMode) {
        print('Coins list fetched: ${coinsList.length} coins.');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Error fetching coins list: $error');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PogiCoin'),
      ),
      body: coinsList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: coinsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(coinsList[index].rank.toString()),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(coinsList[index].name ?? ""),
                        Text(coinsList[index].symbol ?? ""),
                      ],
                    )
                  ],
                );
              },
            ),
    );
  }
}
