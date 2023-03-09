// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/coins_info_model.dart';
import '../Model/coins_list_model.dart';
import 'constants.dart';

class APIService {
  static Future<List<CoinsListModel>> getCoinsList() async {
    var response = await http.get(Uri.parse('${baseURI}coins'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<CoinsListModel> coinsList = data.map((json) => CoinsListModel.fromJson(json)).toList();
      coinsList = coinsList.where((coin) => coin.rank! <= 30 && coin.isActive == true).toList();
      return coinsList;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  static Future<CoinsInfoModel?> getCoinsInfo(String coinsID) async {
    var response = await http.get(Uri.parse('${baseURI}coins/$coinsID'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      CoinsInfoModel coinsInfo = CoinsInfoModel.fromJson(data);
      return coinsInfo;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }


}