import 'package:coin_paprika/Model/coins_info_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../API/api_service.dart';
import '../Model/coins_chart_model.dart';
import '../Model/coins_ticker_model.dart';

class DetailScreen extends StatefulWidget {
  final String coinsID;
  final String coinsName;
  final String coinsSymbol;
  const DetailScreen({
    Key? key,
    required this.coinsID,
    required this.coinsName,
    required this.coinsSymbol}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  CoinsInfoModel? coinsInfoModel;
  CoinsChartModel? coinsChartModel;
  CoinsTickerModel? coinsTickerModel;

  @override
  void initState() {
    super.initState();

    APIService.getCoinsInfo(widget.coinsID).then((value){
      setState(() {
        coinsInfoModel = value;
      });
    });

    APIService.getCoinsChart(widget.coinsID).then((value){
      setState(() {
        coinsChartModel = value;
      });
    });

    APIService.getCoinsTicker(widget.coinsID).then((value){
      setState(() {
        coinsTickerModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: coinsChartModel != null
        ? Container(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage(coinsInfoModel!.logo ?? ""),
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(widget.coinsName),
                        Text(widget.coinsSymbol),
                        Text("USD ${double.parse(coinsTickerModel!.priceUsd!).toStringAsFixed(2)}"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("High: + ${coinsChartModel!.high!.toStringAsFixed(2)}"),
                    Text("Low: - ${coinsChartModel!.low!.toStringAsFixed(2)}"),
                    Text("Open: ${coinsChartModel!.open!.toStringAsFixed(2)}"),
                    Text("Close: ${coinsChartModel!.close!.toStringAsFixed(2)}"),
                    Text("Volume: ${coinsChartModel!.volume}"),
                    Text("Market Cap: ${coinsChartModel!.marketCap}"),
                  ],
                ),

              ),
            ) : const CircularProgressIndicator(),
    );
  }
}

