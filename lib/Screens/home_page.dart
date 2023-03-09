import 'package:coin_paprika/API/api_service.dart';
import 'package:coin_paprika/Screens/detail_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Model/coins_info_model.dart';
import '../Model/coins_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CoinsListModel> coinsList = [];
  String? coinsLogo;

  @override
  void initState() {
    super.initState();
    APIService.getCoinsList().then((value) {
      setState(() {
        coinsList = value;
      });
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
          : Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ListView.separated(
                itemCount: coinsList.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: GestureDetector(
                      onTap: (){
                        if (kDebugMode) {
                          print("Coins ID - ${coinsList[index].id}");
                          print("Coins Logo - $coinsLogo");
                          print("Coins Name - ${coinsList[index].name}");
                          print("Coins Symbol - ${coinsList[index].symbol}");

                        }
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailScreen(
                          coinsID: coinsList[index].id ?? "",
                          coinsLogo: coinsLogo ?? "",
                          coinsName: coinsList[index].name ?? "",
                          coinsSymbol: coinsList[index].symbol ?? "",)));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FutureBuilder<CoinsInfoModel?>(
                              future: APIService.getCoinsInfo(coinsList[index].id ?? ""),
                              builder: (BuildContext context, AsyncSnapshot<CoinsInfoModel?> snapshot) {
                                if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                                  coinsLogo = snapshot.data!.logo ?? "";
                                  return Image(
                                    image: NetworkImage(snapshot.data!.logo ?? ""),
                                    width: 100,
                                    height: 100,

                                  );
                                } else {
                                  return const SizedBox(height: 100, width: 100);
                                }
                              },
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(coinsList[index].name ?? ""),
                                Text(coinsList[index].symbol ?? ""),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
          ),
    );
  }
}
