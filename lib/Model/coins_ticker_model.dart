class CoinsTickerModel {
  String? id;
  String? name;
  String? symbol;
  String? rank;
  String? priceUsd;
  String? priceBtc;
  String? volume24hUsd;
  String? marketCapUsd;
  String? circulatingSupply;
  String? totalSupply;
  String? maxSupply;
  String? percentChange1h;
  String? percentChange24h;
  String? percentChange7d;
  String? lastUpdated;

  CoinsTickerModel(
      {this.id,
        this.name,
        this.symbol,
        this.rank,
        this.priceUsd,
        this.priceBtc,
        this.volume24hUsd,
        this.marketCapUsd,
        this.circulatingSupply,
        this.totalSupply,
        this.maxSupply,
        this.percentChange1h,
        this.percentChange24h,
        this.percentChange7d,
        this.lastUpdated});

  CoinsTickerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    rank = json['rank'];
    priceUsd = json['price_usd'];
    priceBtc = json['price_btc'];
    volume24hUsd = json['volume_24h_usd'];
    marketCapUsd = json['market_cap_usd'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    maxSupply = json['max_supply'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['rank'] = rank;
    data['price_usd'] = priceUsd;
    data['price_btc'] = priceBtc;
    data['volume_24h_usd'] = volume24hUsd;
    data['market_cap_usd'] = marketCapUsd;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['max_supply'] = maxSupply;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
