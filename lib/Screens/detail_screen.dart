import 'package:coin_paprika/Model/coins_info_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../API/api_service.dart';
import '../Model/coins_chart_model.dart';
import '../Model/coins_ticker_model.dart';
import '../custom_widgets.dart';

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
        title: const Align(
            alignment: Alignment.centerLeft,
            child: HeadingText(text: 'Back')),

      ),
      body: coinsChartModel != null
        ? CustomContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: NetworkImage(coinsInfoModel!.logo ?? ""),
                          width: 100,
                          height: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TitleText(text: widget.coinsName),
                            RegularText(text: widget.coinsSymbol),
                            TitleText(text: "USD ${double.parse(coinsTickerModel!.priceUsd!).toStringAsFixed(2)}"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    highLow("High: ","+ ${coinsChartModel!.high!.toStringAsFixed(2)}", Colors.red),
                    highLow("Low: ", "- ${coinsChartModel!.high!.toStringAsFixed(2)}", Colors.green),
                    detailsWidget("Open: ", coinsChartModel!.open!.toStringAsFixed(2)),
                    detailsWidget("Close: ", coinsChartModel!.close!.toStringAsFixed(2)),
                    detailsWidget("Volume: ", coinsChartModel!.volume.toString()),
                    detailsWidget("Market Cap: ", coinsChartModel!.marketCap.toString()),
                  ],
                ),

              ),
            ) : const CircularProgressIndicator(),
    );
  }

  Widget detailsWidget(String title, String subtitle){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TitleText(text: title),
        const SizedBox(width: 10),
        SubtitleText(text: subtitle),
      ],
    );
  }

  Widget highLow(String title, String subtitle, Color color){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TitleText(text: title),
        const SizedBox(width: 10),
        SubtitleText(text: subtitle, color: color),
      ],
    );
  }
}

