import 'package:coin_paprika/API/api_service.dart';
import 'package:coin_paprika/Model/coins_chart_model.dart';
import 'package:coin_paprika/Screens/detail_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Model/coins_info_model.dart';
import '../Model/coins_list_model.dart';
import '../Model/coins_ticker_model.dart';
import '../custom_widgets.dart';

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
        title: const HeadingText(text: 'PogiCoin'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
                          coinsName: coinsList[index].name ?? "",
                          coinsSymbol: coinsList[index].symbol ?? "",)));
                      },
                      child: CustomContainer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FutureBuilder<CoinsInfoModel?>(
                                  future: APIService.getCoinsInfo(coinsList[index].id ?? ""),
                                  builder: (BuildContext context, AsyncSnapshot<CoinsInfoModel?> snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                                      return Image(
                                        image: NetworkImage(snapshot.data!.logo ?? ""),
                                        width: 70,
                                        height: 70,

                                      );
                                    } else {
                                      return const SizedBox(height: 70, width: 70);
                                    }
                                  },
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RegularText(text: coinsList[index].name ?? ""),
                                    RegularText(text: coinsList[index].symbol ?? ""),
                                  ],
                                ),
                              ],
                            ),
                            FutureBuilder<CoinsTickerModel?>(
                              future: APIService.getCoinsTicker(coinsList[index].id ?? ""),
                              builder: (BuildContext context, AsyncSnapshot<CoinsTickerModel?> snapshot) {
                                if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RegularText(text: "USD ${double.parse(snapshot.data!.priceUsd ?? "").toStringAsFixed(2)}", fontSize: 15,),
                                      FutureBuilder<CoinsChartModel?>(
                                        future: APIService.getCoinsChart(coinsList[index].id ?? ""),
                                        builder: (BuildContext context, AsyncSnapshot<CoinsChartModel?> snapshotChart) {
                                          if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                                            return (snapshot.data?.percentChange24h ?? "").contains("-")
                                                ? RedText(text: "- ${snapshotChart.data!.low!.toStringAsFixed(2)}")
                                                : GreenText(text: "+ ${snapshotChart.data!.high!.toStringAsFixed(2)}");
                                          } else {
                                            return const SizedBox(height: 0);
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                } else {
                                  return const SizedBox(height: 0);
                                }
                              },
                            ),
                            FutureBuilder<CoinsTickerModel?>(
                              future: APIService.getCoinsTicker(coinsList[index].id ?? ""),
                              builder: (BuildContext context, AsyncSnapshot<CoinsTickerModel?> snapshot) {
                                if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.show_chart_rounded),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          (snapshot.data?.percentChange24h ?? "").contains("-")
                                              ? const Icon(Icons.arrow_downward_rounded, color: Colors.red)
                                              : const Icon(Icons.arrow_upward_rounded, color: Colors.green),
                                          (snapshot.data?.percentChange24h ?? "").contains("-")
                                              ? RedText(text: "${snapshot.data!.percentChange24h ?? ""} %", fontSize: 15)
                                              : GreenText(text: "+ ${snapshot.data!.percentChange24h ?? ""} %", fontSize: 15),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return const SizedBox(height: 0);
                                }
                              },
                            ),
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
